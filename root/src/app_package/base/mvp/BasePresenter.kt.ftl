package ${baseModulePackage}

import android.os.Bundle

open class ${baseModulePrefix}Presenter <V : ${baseModulePrefix}Contracts.View> : ${baseModulePrefix}Contracts.Presenter <V> {

    /**
     * Properties
     */

    var view: V? = null

    /**
     * ${baseModulePrefix}Contracts.Presenter
     */

    override fun onCreate(bundle: Bundle?) {
    }

    override fun onResume() {
    }

    override fun onStop() {
    }

    override fun onDestroy() {
        view = null
    }
}