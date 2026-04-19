<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        <div id="kc-header-wrapper">
            <span class="kc-logo-text">AEME</span>
            <span class="kc-subtitle">Energy Manager Platform</span>
        </div>
    <#elseif section = "form">
        <div id="kc-form-wrapper">
            <h2>Définir votre mot de passe</h2>
            <span class="kc-form-subtitle">Choisissez un mot de passe sécurisé pour votre compte</span>

            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert-${message.type}">
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
                <input type="text" id="username" name="username"
                       value="${username}" autocomplete="username"
                       readonly style="display:none;"/>

                <div class="form-group">
                    <label for="password-new">Nouveau mot de passe</label>
                    <input type="password" id="password-new" name="password-new"
                           autofocus autocomplete="new-password"
                           placeholder="Minimum 8 caractères"
                           aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"/>
                    <#if messagesPerField.existsError('password')>
                        <span style="color:#cc0000;font-size:12px;margin-top:5px;display:block">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="password-confirm">Confirmer le mot de passe</label>
                    <input type="password" id="password-confirm" name="password-confirm"
                           autocomplete="new-password"
                           placeholder="Répétez votre mot de passe"
                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"/>
                    <#if messagesPerField.existsError('password-confirm')>
                        <span style="color:#cc0000;font-size:12px;margin-top:5px;display:block">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>

                <#if isAppInitiatedAction??>
                    <div class="form-group">
                        <div class="kc-checkbox">
                            <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked>
                            <label for="logout-sessions" style="text-transform:none;font-weight:normal;">
                                Se déconnecter des autres appareils
                            </label>
                        </div>
                    </div>
                </#if>

                <div id="kc-form-buttons">
                    <input type="submit" value="Confirmer le mot de passe"
                           class="pf-c-button pf-m-primary pf-m-block btn-lg"/>
                    <#if isAppInitiatedAction??>
                        <button type="submit" name="cancel-aia" value="true"
                                class="pf-c-button pf-m-link">
                            Annuler
                        </button>
                    </#if>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>