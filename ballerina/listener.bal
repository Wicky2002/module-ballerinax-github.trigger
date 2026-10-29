// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

@display {label: "GitHub Webhooks API", iconPath: "icon.png"}
public class Listener {
    private http:Listener httpListener;
    private ListenerConfig listenerConfig;
    private map<DispatcherService> dispatchers = {};
    private [string, GenericServiceType][] attachments = [];

    public function init(ListenerConfig listenerConfig = {}, int|http:Listener listenOn = 8090) returns error? {
        if listenOn is http:Listener {
            self.httpListener = listenOn;
        } else {
            self.httpListener = check new (listenOn);
        }
        self.listenerConfig = listenerConfig;
    }

    public isolated function attach(GenericServiceType serviceRef, string[]|string? attachPoint) returns error? {
        string serviceTypeStr = check self.getServiceTypeStr(serviceRef);
        string path = self.pathKey(attachPoint);
        DispatcherService dispatcher;
        DispatcherService? existing = self.dispatchers[path];
        if existing is DispatcherService {
            dispatcher = existing;
            check dispatcher.addServiceRef(serviceTypeStr, serviceRef);
        } else {
            dispatcher = new (self.listenerConfig.webhookSecret);
            check dispatcher.addServiceRef(serviceTypeStr, serviceRef);
            check self.httpListener.attach(dispatcher, path == "" ? () : path);
            self.dispatchers[path] = dispatcher;
        }
        self.attachments.push([path, serviceRef]);
    }

    public isolated function detach(GenericServiceType serviceRef) returns error? {
        string serviceTypeStr = check self.getServiceTypeStr(serviceRef);
        boolean detached = false;
        int i = 0;
        while i < self.attachments.length() {
            if self.attachments[i][1] !== serviceRef {
                i += 1;
                continue;
            }
            string path = self.attachments[i][0];
            DispatcherService dispatcher = self.dispatchers.get(path);
            check dispatcher.removeServiceRef(serviceTypeStr);
            _ = self.attachments.remove(i);
            detached = true;
            boolean pathInUse = false;
            foreach [string, GenericServiceType] attachment in self.attachments {
                if attachment[0] == path {
                    pathInUse = true;
                }
            }
            if !pathInUse {
                check self.httpListener.detach(dispatcher);
                _ = self.dispatchers.remove(path);
            }
        }
        if !detached {
            return error(string `Cannot detach the service of type ${serviceTypeStr}. Service has not been attached to the listener before`);
        }
    }

    public isolated function 'start() returns error? {
        return self.httpListener.'start();
    }

    public isolated function gracefulStop() returns error? {
        return self.httpListener.gracefulStop();
    }

    public isolated function immediateStop() returns error? {
        return self.httpListener.immediateStop();
    }

    private isolated function getServiceTypeStr(GenericServiceType serviceRef) returns string|error {
        match serviceRef {
            var v if v is PingService => {
                return "PingService";
            }
            var v if v is PushService => {
                return "PushService";
            }
            var v if v is PullRequestService => {
                return "PullRequestService";
            }
            var v if v is IssuesService => {
                return "IssuesService";
            }
            var v if v is ReleaseService => {
                return "ReleaseService";
            }
            var v if v is IssueCommentService => {
                return "IssueCommentService";
            }
            var v if v is PullRequestReviewService => {
                return "PullRequestReviewService";
            }
            var v if v is PullRequestReviewCommentService => {
                return "PullRequestReviewCommentService";
            }
            var v if v is CreateService => {
                return "CreateService";
            }
            var v if v is DeleteService => {
                return "DeleteService";
            }
            var v if v is ForkService => {
                return "ForkService";
            }
            var v if v is StarService => {
                return "StarService";
            }
            var v if v is WatchService => {
                return "WatchService";
            }
            var v if v is CheckRunService => {
                return "CheckRunService";
            }
            var v if v is CheckSuiteService => {
                return "CheckSuiteService";
            }
            var v if v is DeploymentService => {
                return "DeploymentService";
            }
            var v if v is DeploymentStatusService => {
                return "DeploymentStatusService";
            }
            var v if v is WorkflowRunService => {
                return "WorkflowRunService";
            }
            var v if v is WorkflowJobService => {
                return "WorkflowJobService";
            }
            var v if v is RepositoryService => {
                return "RepositoryService";
            }
            var v if v is MemberService => {
                return "MemberService";
            }
            var v if v is DiscussionService => {
                return "DiscussionService";
            }
            var v if v is DiscussionCommentService => {
                return "DiscussionCommentService";
            }
            var v if v is LabelService => {
                return "LabelService";
            }
            var v if v is MilestoneService => {
                return "MilestoneService";
            }
            var v if v is StatusService => {
                return "StatusService";
            }
            var v if v is WorkflowDispatchService => {
                return "WorkflowDispatchService";
            }
            var v if v is PullRequestReviewThreadService => {
                return "PullRequestReviewThreadService";
            }
            var v if v is TeamService => {
                return "TeamService";
            }
            var v if v is OrganizationService => {
                return "OrganizationService";
            }
            var v if v is DeploymentProtectionRuleService => {
                return "DeploymentProtectionRuleService";
            }
            var v if v is DeploymentReviewService => {
                return "DeploymentReviewService";
            }
            var v if v is InstallationTargetService => {
                return "InstallationTargetService";
            }
            var v if v is IssueDependenciesService => {
                return "IssueDependenciesService";
            }
            var v if v is MarketplacePurchaseService => {
                return "MarketplacePurchaseService";
            }
            var v if v is PersonalAccessTokenRequestService => {
                return "PersonalAccessTokenRequestService";
            }
            var v if v is ProjectService => {
                return "ProjectService";
            }
            var v if v is ProjectCardService => {
                return "ProjectCardService";
            }
            var v if v is ProjectColumnService => {
                return "ProjectColumnService";
            }
            var v if v is RepositoryImportService => {
                return "RepositoryImportService";
            }
            var v if v is SubIssuesService => {
                return "SubIssuesService";
            }
            var v if v is PageBuildService => {
                return "PageBuildService";
            }
            var v if v is TeamAddService => {
                return "TeamAddService";
            }
            var v if v is SponsorshipService => {
                return "SponsorshipService";
            }
            var v if v is SecurityAndAnalysisService => {
                return "SecurityAndAnalysisService";
            }
            var v if v is BranchProtectionConfigurationService => {
                return "BranchProtectionConfigurationService";
            }
            var v if v is CustomPropertyService => {
                return "CustomPropertyService";
            }
            var v if v is CustomPropertyValuesService => {
                return "CustomPropertyValuesService";
            }
            var v if v is ProjectsV2itemService => {
                return "ProjectsV2itemService";
            }
            var v if v is ProjectsV2statusUpdateService => {
                return "ProjectsV2statusUpdateService";
            }
            var v if v is RegistryPackageService => {
                return "RegistryPackageService";
            }
            var v if v is RepositoryRulesetService => {
                return "RepositoryRulesetService";
            }
            var v if v is RepositoryVulnerabilityAlertService => {
                return "RepositoryVulnerabilityAlertService";
            }
            var v if v is SecretScanningAlertLocationService => {
                return "SecretScanningAlertLocationService";
            }
            var v if v is SecretScanningScanService => {
                return "SecretScanningScanService";
            }
            var v if v is BranchProtectionRuleService => {
                return "BranchProtectionRuleService";
            }
            var v if v is CodeScanningAlertService => {
                return "CodeScanningAlertService";
            }
            var v if v is DeployKeyService => {
                return "DeployKeyService";
            }
            var v if v is GithubAppAuthorizationService => {
                return "GithubAppAuthorizationService";
            }
            var v if v is MetaService => {
                return "MetaService";
            }
            var v if v is OrgBlockService => {
                return "OrgBlockService";
            }
            var v if v is PackageService => {
                return "PackageService";
            }
            var v if v is ProjectsV2Service => {
                return "ProjectsV2Service";
            }
            var v if v is RepositoryAdvisoryService => {
                return "RepositoryAdvisoryService";
            }
            var v if v is SecurityAdvisoryService => {
                return "SecurityAdvisoryService";
            }
            var v if v is CommitCommentService => {
                return "CommitCommentService";
            }
            var v if v is DependabotAlertService => {
                return "DependabotAlertService";
            }
            var v if v is GollumService => {
                return "GollumService";
            }
            var v if v is InstallationService => {
                return "InstallationService";
            }
            var v if v is InstallationRepositoriesService => {
                return "InstallationRepositoriesService";
            }
            var v if v is MembershipService => {
                return "MembershipService";
            }
            var v if v is MergeGroupService => {
                return "MergeGroupService";
            }
            var v if v is PublicService => {
                return "PublicService";
            }
            var v if v is RepositoryDispatchService => {
                return "RepositoryDispatchService";
            }
            var v if v is SecretScanningAlertService => {
                return "SecretScanningAlertService";
            }
            var _ => {
                return error("Unrecognized service type attached to the listener");
            }
        }
    }

    private isolated function pathKey(string[]|string? attachPoint) returns string {
        if attachPoint is () {
            return "";
        }
        string path = attachPoint is string ? attachPoint : string:'join("/", ...attachPoint);
        while path.startsWith("/") {
            path = path.substring(1);
        }
        while path.endsWith("/") {
            path = path.substring(0, path.length() - 1);
        }
        return path;
    }
}
