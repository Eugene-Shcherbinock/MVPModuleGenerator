<?xml version="1.0"?>

<#import "root://activities/common/kotlin_macros.ftl" as kt>

<recipe>
    <@kt.addAllKotlinDependencies />

    <#if !(hasDependency('com.android.support:support-v4'))>
        <dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/>
    </#if>

    <dependency mavenUrl="com.android.support.constraint:constraint-layout:+" />

    <#if moduleType=="1">

        <#if includeBaseModule>
            <instantiate from="src/app_package/base/mvp/BaseContracts.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${baseModulePrefix}Contracts.kt" />
            <instantiate from="src/app_package/base/mvp/BaseFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${baseModulePrefix}ModuleFragment.kt" />
            <instantiate from="src/app_package/base/mvp/BasePresenter.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${baseModulePrefix}Presenter.kt" />
            <instantiate from="src/app_package/base/mvp/BaseModuleActivity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${baseModulePrefix}ModuleActivity.kt" />
            <instantiate from="src/app_package/base/mvp/ToolbarHandlerType.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/ToolbarHandlerType.kt" />

            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Contracts.kt" />
            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}ModuleFragment.kt" />
            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Presenter.kt" />
            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}ModuleActivity.kt" />
            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}ToolbarHandlerType.kt" />
        </#if>

        <#if viewType=="1">
            <merge from="AndroidManifest.xml.ftl"
                to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />

            <instantiate from="src/app_package/module/mvp/ModuleActivity.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${moduleName}Activity.kt" />

            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Activity.kt" />
        <#else>
            <instantiate from="src/app_package/module/mvp/ModuleViewFragment.kt.ftl"
                to="${escapeXmlAttribute(srcOut)}/${moduleName}Fragment.kt" />

            <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Fragment.kt" />
        </#if>

        <#if includeViewLayout>
            <instantiate from="res/layout/view_layout.xml.ftl"
                to="${escapeXmlAttribute(resOut)}/layout/${viewLayoutName}.xml" />
            <open file="${escapeXmlAttribute(resOut)}/layout/${viewLayoutName}.xml" />
        </#if>

        <instantiate from="src/app_package/module/mvp/ModuleContracts.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/${moduleName}Contracts.kt" />

        <instantiate from="src/app_package/module/mvp/ModuleConfigurator.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/${moduleName}ModuleConfigurator.kt" />

        <instantiate from="src/app_package/module/mvp/ModulePresenter.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/${moduleName}Presenter.kt" />

        <instantiate from="src/app_package/module/mvp/ModuleRouter.kt.ftl"
            to="${escapeXmlAttribute(srcOut)}/${moduleName}Router.kt" />


        <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Contracts.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Presenter.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/${moduleName}Router.kt" />

    </#if>

</recipe>

