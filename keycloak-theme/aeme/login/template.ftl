<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AEME — Energy Platform</title>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
        </#list>
    </#if>
</head>
<body>
    <div id="kc-container-wrapper">
        <div id="kc-container">
            <div id="kc-content">
                <div id="kc-content-wrapper">
                    <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="aeme-error">
                            ${kcSanitize(message.summary)?no_esc}
                        </div>
                    </#if>
                    <#nested "form">
                    <#if displayInfo>
                        <#nested "info">
                    </#if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>