<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        AEME
    <#elseif section = "form">
        <div class="aeme-container">

            <!-- Left Panel -->
            <div class="aeme-left">
                <div class="aeme-left-content">
                    <div class="aeme-brand">
                    <!-- 
                        <div class="aeme-logo">
                            <span class="aeme-logo-text">AEME</span> 
                        </div>
                    -->
                        <span class="aeme-brand-name">Energy Platform</span>
                    </div>
                    <h1 class="aeme-left-title">
                        Bienvenue sur la plateforme des Gestionnaires de l'Énergie
                    </h1>
                    <p class="aeme-left-sub">
                        Soumettez vos rapports mensuels et annuels, communiquez avec vos collègues et gardez une archive organisée de vos réunions.
                    </p>
                    <div class="aeme-features">
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Sécurité de niveau gouvernemental</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
                            </div>
                            <span>Rapports : soumission et consolidation</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
                            </div>
                            <span>Chat et gestion des réunions</span>
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
                        <h2 class="aeme-form-title">Connexion à votre compte</h2>
                        <p class="aeme-form-sub">Entrez vos identifiants pour accéder à votre espace gestionnaire.</p>
                    </div>

                    <#if messagesPerField.existsError('username','password')>
                        <div class="aeme-error">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))}
                        </div>
                    </#if>

                    <form id="kc-form-login" action="${url.loginAction}" method="post">

                        <div class="aeme-field">
                            <label for="username">
                                <#if !realm.loginWithEmailAllowed>Nom d'utilisateur
                                <#elseif !realm.registrationEmailAsUsername>Email ou nom d'utilisateur
                                <#else>Email
                                </#if>
                            </label>
                            <input
                                id="username"
                                name="username"
                                type="text"
                                autofocus
                                autocomplete="username"
                                value="${login.username!''}"
                                placeholder="votre@email.sn"
                            />
                        </div>

                        <div class="aeme-field">
                            <div class="aeme-field-row">
                                <label for="password">Mot de passe</label>
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="aeme-forgot">
                                        Mot de passe oublié ?
                                    </a>
                                </#if>
                            </div>
                            <input
                                id="password"
                                name="password"
                                type="password"
                                autocomplete="current-password"
                                placeholder="••••••••"
                            />
                        </div>

                        <#if usernameHidden?? && messagesPerField.existsError('username')>
                            <div class="aeme-error">
                                ${kcSanitize(messagesPerField.getFirstError('username'))}
                            </div>
                        </#if>

                        <input type="hidden" id="id-hidden-input" name="credentialId"
                            <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>
                        />

                        <button type="submit" class="aeme-btn">
                            Se connecter
                        </button>

                    </form>

                    <p class="aeme-footer">
                        © ${.now?string('yyyy')} AEME — Agence pour l'Économie et la Maîtrise de l'Énergie
                    </p>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>