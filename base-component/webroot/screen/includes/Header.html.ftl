<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#if html_keywords?has_content><meta name="keywords" content="${html_keywords}"></#if>
    <#if html_description?has_content><meta name="description" content="${html_description}"></#if>
    <#assign parentMenuName = (sri.screenUrlInfo.parentScreen.getDefaultMenuName())!"">
    <#assign defaultMenuName = sri.screenUrlInfo.targetScreen.getDefaultMenuName()>
    <title><#if html_title?has_content>${html_title}<#else><#if parentMenuName?has_content>${ec.resource.expand(parentMenuName, "")} - </#if><#if defaultMenuName?has_content>${ec.resource.expand(defaultMenuName, "")}</#if></#if></title>
    <link rel="apple-touch-icon" href="/MoquiLogo100.png"/>
<#-- Style Sheets -->
<#list sri.getThemeValues("STRT_STYLESHEET") as styleSheetLocation>
    <#assign hrefUrl = sri.buildUrl(styleSheetLocation).url>
    <link href="${hrefUrl}<#if !styleSheetLocation?starts_with("http") && !hrefUrl?contains("?")>?v=${ec.web.getResourceDistinctValue()}</#if>" rel="stylesheet" type="text/css">
</#list>
<#list html_stylesheets?if_exists as styleSheetLocation>
    <#assign hrefUrl = sri.buildUrl(styleSheetLocation).url>
    <link href="${hrefUrl}<#if !styleSheetLocation?starts_with("http") && !hrefUrl?contains("?")>?v=${ec.web.getResourceDistinctValue()}</#if>" rel="stylesheet" type="text/css">
</#list>
<#-- JavaScript -->
<#list html_scripts?if_exists as scriptLocation>
    <#assign srcUrl = sri.buildUrl(scriptLocation).url>
    <script src="${srcUrl}<#if !scriptLocation?starts_with("http") && !srcUrl?contains("?")>?v=${ec.web.getResourceDistinctValue()}</#if>" type="text/javascript"></script>
</#list>
<#list sri.getThemeValues("STRT_SCRIPT") as scriptLocation>
    <#assign srcUrl = sri.buildUrl(scriptLocation).url>
    <script src="${srcUrl}<#if !scriptLocation?starts_with("http") && !srcUrl?contains("?")>?v=${ec.web.getResourceDistinctValue()}</#if>" type="text/javascript"></script>
</#list>
    <script defer data-domain="coarchy.com" src="https://plausible.io/js/script.js"></script>
    <script defer src="https://umami.coarchy.com/script.js" data-website-id="3870ea78-ffac-4a20-a878-f0c08815368f"></script>
    <script>
      (function(d,t) {
        var BASE_URL="https://chat.coarchy.com";
        var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src=BASE_URL+"/packs/js/sdk.js";
        g.defer = true;
        g.async = true;
        s.parentNode.insertBefore(g,s);
        g.onload=function(){
          window.chatwootSDK.run({
            websiteToken: 'oDEdsmRPCJhoPQQeMYuNHBrF',
            baseUrl: BASE_URL
          })
        }
      })(document,"script");
    </script>
<#-- Icon -->
<#list sri.getThemeValues("STRT_SHORTCUT_ICON") as iconLocation>
    <link rel="shortcut icon" href="${sri.buildUrl(iconLocation).url}">
</#list>
</head>
<#assign bodyClassList = sri.getThemeValues("STRT_BODY_CLASS")>
<#assign instancePurpose = Static["java.lang.System"].getProperty("instance_purpose")!"production">
<body class="${instancePurpose}<#list bodyClassList as bodyClass> ${bodyClass}</#list> ${(sri.screenUrlInfo.targetScreen.screenName)!""}<#if hideNav! == "true"> hide-nav</#if>">
