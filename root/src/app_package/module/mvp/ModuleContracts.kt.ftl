package ${modulePackage}

import ${baseModulePackage}.${baseModulePrefix}Contracts

object ${moduleName}ModuleContracts {

    interface View : ${baseModulePrefix}Contracts.View {


    }

    interface Presenter : ${baseModulePrefix}Contracts.Presenter <View> {


    }

    interface Router : ${baseModulePrefix}Contracts.Router {

    }

}