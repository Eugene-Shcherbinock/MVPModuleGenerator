package ${modulePackage}.view

import android.view.View
import ${packageName}.R
import ${modulePackage}.${moduleName}ModuleContracts
import ${baseModulePackage}.${baseModulePrefix}ModuleFragment

class ${moduleName}Fragment : ${baseModulePrefix}ModuleFragment<${moduleName}ModuleContracts.View, ${moduleName}ModuleContracts.Presenter>(),
    ${moduleName}ModuleContracts.View {

    /**
     * Factory
     */

    companion object {

        @JvmStatic
        fun newInstance() = ${moduleName}Fragment()

    }

    /**
     * Properties
     */

    public override lateinit var presenter: ${moduleName}ModuleContracts.Presenter

    override var contentLayoutId: Int = R.layout.${viewLayoutName}
    override var toolbarTitle: String = "${moduleName}"

    /**
     * ${moduleName}ModuleContracts.View
     */

    /**
     * Private Methods
     */

    override fun updateViewDependencies(view: View) {
        super.updateViewDependencies(view)
    }

}