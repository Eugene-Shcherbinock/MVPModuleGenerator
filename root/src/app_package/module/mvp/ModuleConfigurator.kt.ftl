package ${modulePackage}

import ${modulePackage}.presenter.${moduleName}Presenter
import ${modulePackage}.router.${moduleName}Router
import ${modulePackage}.view.${moduleName}Fragment

class ${moduleName}ModuleConfigurator {

    var view: ${moduleName}Fragment private set

    init {
        view = ${moduleName}Fragment.newInstance()
    }

    fun configure() {
        val router = ${moduleName}Router()

        val presenter = ${moduleName}Presenter()
        presenter.router = router
        presenter.view = view

        view.presenter = presenter
    }

}