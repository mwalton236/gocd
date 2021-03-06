/*************************GO-LICENSE-START*********************************
 * Copyright 2014 ThoughtWorks, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *************************GO-LICENSE-END***********************************/

package com.thoughtworks.go.plugin.access.scm;

import com.thoughtworks.go.plugin.access.PluginInteractionCallback;
import com.thoughtworks.go.plugin.access.PluginRequestHelper;
import com.thoughtworks.go.plugin.access.scm.revision.SCMRevision;
import com.thoughtworks.go.plugin.api.response.Result;
import com.thoughtworks.go.plugin.api.response.validation.ValidationResult;
import com.thoughtworks.go.plugin.infra.PluginManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.util.Arrays.asList;

@Component
public class SCMExtension implements SCMExtensionContract {
    public static final String EXTENSION_NAME = "scm";
    public static final String REQUEST_SCM_CONFIGURATION = "scm-configuration";
    public static final String REQUEST_SCM_VIEW = "scm-view";
    public static final String REQUEST_VALIDATE_SCM_CONFIGURATION = "validate-scm-configuration";
    public static final String REQUEST_CHECK_SCM_CONNECTION = "check-scm-connection";
    public static final String REQUEST_LATEST_REVISION = "latest-revision";
    public static final String REQUEST_LATEST_REVISIONS_SINCE = "latest-revisions-since";
    public static final String REQUEST_CHECKOUT = "checkout";
    private static final List<String> goSupportedVersions = asList("1.0");

    private PluginManager pluginManager;
    private final PluginRequestHelper pluginRequestHelper;
    private Map<String, JsonMessageHandler> messageHandlerMap = new HashMap<String, JsonMessageHandler>();

    @Autowired
    public SCMExtension(PluginManager defaultPluginManager) {
        this.pluginManager = defaultPluginManager;
        pluginRequestHelper = new PluginRequestHelper(defaultPluginManager, goSupportedVersions, EXTENSION_NAME);
        messageHandlerMap.put("1.0", new JsonMessageHandler1_0());
    }

    public SCMPropertyConfiguration getSCMConfiguration(String pluginId) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_SCM_CONFIGURATION, new PluginInteractionCallback<SCMPropertyConfiguration>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public SCMPropertyConfiguration onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForSCMConfiguration(responseBody);
            }
        });
    }

    public SCMView getSCMView(String pluginId) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_SCM_VIEW, new PluginInteractionCallback<SCMView>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public SCMView onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForSCMView(responseBody);
            }
        });
    }

    public ValidationResult isSCMConfigurationValid(String pluginId, final SCMPropertyConfiguration scmConfiguration) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_VALIDATE_SCM_CONFIGURATION, new PluginInteractionCallback<ValidationResult>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).requestMessageForIsSCMConfigurationValid(scmConfiguration);
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public ValidationResult onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForIsSCMConfigurationValid(responseBody);
            }
        });
    }

    public Result checkConnectionToSCM(String pluginId, final SCMPropertyConfiguration scmConfiguration) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_CHECK_SCM_CONNECTION, new PluginInteractionCallback<Result>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).requestMessageForCheckConnectionToSCM(scmConfiguration);
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public Result onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForCheckConnectionToSCM(responseBody);
            }
        });
    }

    public SCMRevision getLatestRevision(String pluginId, final SCMPropertyConfiguration scmConfiguration, final String flyweightFolder) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_LATEST_REVISION, new PluginInteractionCallback<SCMRevision>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).requestMessageForLatestRevision(scmConfiguration, flyweightFolder);
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public SCMRevision onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForLatestRevision(responseBody);
            }
        });
    }

    public List<SCMRevision> latestModificationSince(String pluginId, final SCMPropertyConfiguration scmConfiguration, final String flyweightFolder, final SCMRevision previouslyKnownRevision) {
        return pluginRequestHelper.submitRequest(pluginId, REQUEST_LATEST_REVISIONS_SINCE, new PluginInteractionCallback<List<SCMRevision>>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).requestMessageForLatestRevisionsSince(scmConfiguration, flyweightFolder, previouslyKnownRevision);
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public List<SCMRevision> onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForLatestRevisionsSince(responseBody);
            }
        });
    }

    public Result checkout(String pluginId, final SCMPropertyConfiguration scmConfiguration, final String destinationFolder, final SCMRevision revision) {
        return pluginRequestHelper.submitRequest(pluginId, SCMExtension.REQUEST_CHECKOUT, new PluginInteractionCallback<Result>() {
            @Override
            public String requestBody(String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).requestMessageForCheckout(scmConfiguration, destinationFolder, revision);
            }

            @Override
            public Map<String, String> requestParams(String resolvedExtensionVersion) {
                return null;
            }

            @Override
            public Result onSuccess(String responseBody, String resolvedExtensionVersion) {
                return messageHandlerMap.get(resolvedExtensionVersion).responseMessageForCheckout(responseBody);
            }
        });
    }

    boolean isSCMPlugin(String pluginId) {
        return pluginManager.isPluginOfType(SCMExtension.EXTENSION_NAME, pluginId);
    }

    Map<String, JsonMessageHandler> getMessageHandlerMap() {
        return messageHandlerMap;
    }
}
