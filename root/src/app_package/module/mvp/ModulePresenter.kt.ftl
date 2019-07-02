package ${modulePackage}.presenter

import ${modulePackage}.${moduleName}ModuleContracts
import ${baseModulePackage}.${baseModulePrefix}Presenter
import java.lang.Error

class ${moduleName}Presenter : ${baseModulePrefix}Presenter<${moduleName}ModuleContracts.View>(), ${moduleName}ModuleContracts.Presenter {

    /**
     * Properties
     */

    lateinit var router: ${moduleName}ModuleContracts.Router

    /**
     * ${moduleName}ModuleContracts.Presenter
     */

}