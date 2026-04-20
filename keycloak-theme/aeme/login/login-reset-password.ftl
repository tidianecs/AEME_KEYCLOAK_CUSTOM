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
                        Réinitialisation du mot de passe
                    </h1>
                    <p class="aeme-left-sub">
                        Entrez votre adresse email et nous vous enverrons un lien pour réinitialiser votre mot de passe.
                    </p>
                    <div class="aeme-features">
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Lien valable 24 heures</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                            </div>
                            <span>Vérifiez votre boîte email</span>
                        </div>
                        <div class="aeme-feature">
                            <div class="aeme-feature-icon">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                            </div>
                            <span>Contactez votre administrateur si besoin</span>
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
                            <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#003366" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                        </div>
                        <h2 class="aeme-form-title">Mot de passe oublié ?</h2>
                        <p class="aeme-form-sub">Entrez votre email pour recevoir un lien de réinitialisation.</p>
                    </div>

                    <#if messagesPerField.existsError('username')>
                        <div class="aeme-error">
                            ${kcSanitize(messagesPerField.getFirstError('username'))}
                        </div>
                    </#if>

                    <form id="kc-reset-password-form" action="${url.loginAction}" method="post">

                        <div class="aeme-field">
                            <label for="username">
                                <#if !realm.loginWithEmailAllowed>Nom d'utilisateur
                                <#elseif !realm.registrationEmailAsUsername>Email ou nom d'utilisateur
                                <#else>Email</#if>
                            </label>
                            <input
                                type="text"
                                id="username"
                                name="username"
                                autofocus
                                autocomplete="username"
                                value="${(auth.attemptedUsername!'')}"
                                placeholder="votre@email.sn"
                            />
                        </div>

                        <button type="submit" class="aeme-btn">
                            Envoyer le lien
                        </button>

                        <a href="${url.loginUrl}" class="aeme-btn-secondary"
                           style="display:block;text-align:center;text-decoration:none;margin-top:10px;
                                  padding:12px;border:2px solid #003366;border-radius:8px;
                                  color:#003366;font-weight:600;font-size:15px;">
                            Retour à la connexion
                        </a>

                    </form>

                    <p class="aeme-footer">
                        © ${.now?string('yyyy')} AEME — Agence pour l'Économie et la Maîtrise de l'Énergie
                    </p>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>