<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        AEME
    <#elseif section = "form">
        <div class="aeme-container">

            <!-- Left Panel -->
            <div class="aeme-left">
                <div class="aeme-left-content">
                    <div class="aeme-brand">
                        <span class="aeme-brand-name">Energy Platform</span>
                    </div>
                    <h1 class="aeme-left-title">
                        Définissez votre mot de passe
                    </h1>
                    <p class="aeme-left-sub">
                        Pour sécuriser votre compte, veuillez choisir un mot de passe personnel. Il remplacera le mot de passe temporaire qui vous a été envoyé par email.
                    </p>
                    <div class="aeme-features">
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Minimum 8 caractères</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Utilisez lettres, chiffres et symboles</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Ne partagez jamais votre mot de passe</span>
                        </div>
                    </div>
                </div>
                <div class="aeme-circle-bottom"></div>
                <div class="aeme-circle-top"></div>
            </div>

            <!-- Right Panel -->
            <div class="aeme-right">
                <div class="aeme-form-wrapper">

                    <div class="aeme-form-header">
                        <div class="aeme-lock-icon">
                            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                        </div>
                        <h2 class="aeme-form-title">Nouveau mot de passe</h2>
                        <p class="aeme-form-sub">Choisissez un mot de passe sécurisé pour accéder à votre espace gestionnaire.</p>
                    </div>

                    <#if messagesPerField.existsError('password','password-confirm')>
                        <div class="aeme-error">
                            ${kcSanitize(messagesPerField.getFirstError('password','password-confirm'))}
                        </div>
                    </#if>

                    <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
                        <input type="text" id="username" name="username"
                               value="${username}" autocomplete="username"
                               readonly style="display:none;"/>

                        <div class="aeme-field">
                            <label for="password-new">Nouveau mot de passe</label>
                            <input
                                type="password"
                                id="password-new"
                                name="password-new"
                                autofocus
                                autocomplete="new-password"
                                placeholder="••••••••"
                            />
                            <#if messagesPerField.existsError('password')>
                                <span class="aeme-field-error">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="aeme-field">
                            <label for="password-confirm">Confirmer le mot de passe</label>
                            <input
                                type="password"
                                id="password-confirm"
                                name="password-confirm"
                                autocomplete="new-password"
                                placeholder="••••••••"
                            />
                            <#if messagesPerField.existsError('password-confirm')>
                                <span class="aeme-field-error">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <#if isAppInitiatedAction??>
                            <div class="aeme-checkbox-row">
                                <input type="checkbox" id="logout-sessions"
                                       name="logout-sessions" value="on" checked/>
                                <label for="logout-sessions" class="aeme-checkbox-label">
                                    Se déconnecter des autres appareils
                                </label>
                            </div>
                        </#if>

                        <button type="submit" class="aeme-btn">
                            Confirmer le mot de passe
                        </button>

                        <#if isAppInitiatedAction??>
                            <button type="submit" name="cancel-aia" value="true"
                                    class="aeme-btn-secondary">
                                Annuler
                            </button>
                        </#if>
                    </form>

                    <p class="aeme-footer">
                        © ${.now?string('yyyy')} AEME — Agence pour l'Économie et la Maîtrise de l'Énergie
                    </p>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>