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
            self.httpListener = check new (listenOn, requestLimits = {maxEntityBodySize: 26214400});
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
            boolean pathInUse = false;
            foreach int j in 0 ..< self.attachments.length() {
                if j != i && self.attachments[j][0] == path {
                    pathInUse = true;
                }
            }
            if !pathInUse {
                check self.httpListener.detach(dispatcher);
                _ = self.dispatchers.remove(path);
            }
            check dispatcher.removeServiceRef(serviceTypeStr);
            _ = self.attachments.remove(i);
            detached = true;
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
        string[] matched = [];
        if serviceRef is PingService {
            matched.push("PingService");
        }
        if serviceRef is PushService {
            matched.push("PushService");
        }
        if serviceRef is PullRequestService {
            matched.push("PullRequestService");
        }
        if serviceRef is IssuesService {
            matched.push("IssuesService");
        }
        if serviceRef is ReleaseService {
            matched.push("ReleaseService");
        }
        if serviceRef is IssueCommentService {
            matched.push("IssueCommentService");
        }
        if serviceRef is PullRequestReviewService {
            matched.push("PullRequestReviewService");
        }
        if serviceRef is PullRequestReviewCommentService {
            matched.push("PullRequestReviewCommentService");
        }
        if serviceRef is CreateService {
            matched.push("CreateService");
        }
        if serviceRef is DeleteService {
            matched.push("DeleteService");
        }
        if serviceRef is ForkService {
            matched.push("ForkService");
        }
        if serviceRef is StarService {
            matched.push("StarService");
        }
        if serviceRef is WatchService {
            matched.push("WatchService");
        }
        if serviceRef is CheckRunService {
            matched.push("CheckRunService");
        }
        if serviceRef is CheckSuiteService {
            matched.push("CheckSuiteService");
        }
        if serviceRef is DeploymentService {
            matched.push("DeploymentService");
        }
        if serviceRef is DeploymentStatusService {
            matched.push("DeploymentStatusService");
        }
        if serviceRef is WorkflowRunService {
            matched.push("WorkflowRunService");
        }
        if serviceRef is WorkflowJobService {
            matched.push("WorkflowJobService");
        }
        if serviceRef is RepositoryService {
            matched.push("RepositoryService");
        }
        if serviceRef is MemberService {
            matched.push("MemberService");
        }
        if serviceRef is DiscussionService {
            matched.push("DiscussionService");
        }
        if serviceRef is DiscussionCommentService {
            matched.push("DiscussionCommentService");
        }
        if serviceRef is LabelService {
            matched.push("LabelService");
        }
        if serviceRef is MilestoneService {
            matched.push("MilestoneService");
        }
        if serviceRef is StatusService {
            matched.push("StatusService");
        }
        if serviceRef is WorkflowDispatchService {
            matched.push("WorkflowDispatchService");
        }
        if serviceRef is PullRequestReviewThreadService {
            matched.push("PullRequestReviewThreadService");
        }
        if serviceRef is TeamService {
            matched.push("TeamService");
        }
        if serviceRef is OrganizationService {
            matched.push("OrganizationService");
        }
        if serviceRef is DeploymentProtectionRuleService {
            matched.push("DeploymentProtectionRuleService");
        }
        if serviceRef is DeploymentReviewService {
            matched.push("DeploymentReviewService");
        }
        if serviceRef is InstallationTargetService {
            matched.push("InstallationTargetService");
        }
        if serviceRef is IssueDependenciesService {
            matched.push("IssueDependenciesService");
        }
        if serviceRef is MarketplacePurchaseService {
            matched.push("MarketplacePurchaseService");
        }
        if serviceRef is PersonalAccessTokenRequestService {
            matched.push("PersonalAccessTokenRequestService");
        }
        if serviceRef is ProjectService {
            matched.push("ProjectService");
        }
        if serviceRef is ProjectCardService {
            matched.push("ProjectCardService");
        }
        if serviceRef is ProjectColumnService {
            matched.push("ProjectColumnService");
        }
        if serviceRef is RepositoryImportService {
            matched.push("RepositoryImportService");
        }
        if serviceRef is SubIssuesService {
            matched.push("SubIssuesService");
        }
        if serviceRef is PageBuildService {
            matched.push("PageBuildService");
        }
        if serviceRef is TeamAddService {
            matched.push("TeamAddService");
        }
        if serviceRef is SponsorshipService {
            matched.push("SponsorshipService");
        }
        if serviceRef is SecurityAndAnalysisService {
            matched.push("SecurityAndAnalysisService");
        }
        if serviceRef is BranchProtectionConfigurationService {
            matched.push("BranchProtectionConfigurationService");
        }
        if serviceRef is CustomPropertyService {
            matched.push("CustomPropertyService");
        }
        if serviceRef is CustomPropertyValuesService {
            matched.push("CustomPropertyValuesService");
        }
        if serviceRef is ProjectsV2itemService {
            matched.push("ProjectsV2itemService");
        }
        if serviceRef is ProjectsV2statusUpdateService {
            matched.push("ProjectsV2statusUpdateService");
        }
        if serviceRef is RegistryPackageService {
            matched.push("RegistryPackageService");
        }
        if serviceRef is RepositoryRulesetService {
            matched.push("RepositoryRulesetService");
        }
        if serviceRef is RepositoryVulnerabilityAlertService {
            matched.push("RepositoryVulnerabilityAlertService");
        }
        if serviceRef is SecretScanningAlertLocationService {
            matched.push("SecretScanningAlertLocationService");
        }
        if serviceRef is SecretScanningScanService {
            matched.push("SecretScanningScanService");
        }
        if serviceRef is BranchProtectionRuleService {
            matched.push("BranchProtectionRuleService");
        }
        if serviceRef is CodeScanningAlertService {
            matched.push("CodeScanningAlertService");
        }
        if serviceRef is DeployKeyService {
            matched.push("DeployKeyService");
        }
        if serviceRef is GithubAppAuthorizationService {
            matched.push("GithubAppAuthorizationService");
        }
        if serviceRef is MetaService {
            matched.push("MetaService");
        }
        if serviceRef is OrgBlockService {
            matched.push("OrgBlockService");
        }
        if serviceRef is PackageService {
            matched.push("PackageService");
        }
        if serviceRef is ProjectsV2Service {
            matched.push("ProjectsV2Service");
        }
        if serviceRef is RepositoryAdvisoryService {
            matched.push("RepositoryAdvisoryService");
        }
        if serviceRef is SecurityAdvisoryService {
            matched.push("SecurityAdvisoryService");
        }
        if serviceRef is CommitCommentService {
            matched.push("CommitCommentService");
        }
        if serviceRef is DependabotAlertService {
            matched.push("DependabotAlertService");
        }
        if serviceRef is GollumService {
            matched.push("GollumService");
        }
        if serviceRef is InstallationService {
            matched.push("InstallationService");
        }
        if serviceRef is InstallationRepositoriesService {
            matched.push("InstallationRepositoriesService");
        }
        if serviceRef is MembershipService {
            matched.push("MembershipService");
        }
        if serviceRef is MergeGroupService {
            matched.push("MergeGroupService");
        }
        if serviceRef is PublicService {
            matched.push("PublicService");
        }
        if serviceRef is RepositoryDispatchService {
            matched.push("RepositoryDispatchService");
        }
        if serviceRef is SecretScanningAlertService {
            matched.push("SecretScanningAlertService");
        }
        if matched.length() == 1 {
            return matched[0];
        }
        if matched.length() == 0 {
            return error("Unrecognized service type attached to the listener");
        }
        return error(string `The service matches more than one service type (${string:'join(", ", ...matched)}). Implement one service type per service`);
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
