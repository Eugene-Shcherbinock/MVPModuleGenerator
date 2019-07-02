package ${modulePackage}.view

import ${packageName}.R
import ${modulePackage}.${moduleName}ModuleContracts
import ${baseModulePackage}.${baseModulePrefix}ModuleActivity

class ${moduleName}Activity : ${baseModulePrefix}ModuleActivity<${moduleName}ModuleContracts.View, ${moduleName}ModuleContracts.Presenter>(),
    ${moduleName}ModuleContracts.View {

    /**
     * Properties
     */

    public override lateinit var presenter: ${moduleName}ModuleContracts.Presenter

    override var contentLayoutId: Int = R.layout.${viewLayoutName}

    /**
     * ${moduleName}ModuleContracts.View
     */

    /**
     * Protected Methods
     */

    override fun configureModule() {}

}