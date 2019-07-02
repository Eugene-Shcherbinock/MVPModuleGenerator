package ${baseModulePackage}

import android.content.Context
import android.os.Bundle
import java.lang.Error

object ${baseModulePrefix}Contracts {

    interface View {

        fun getContext(): Context

        fun showLoading(message: String)
        fun showLoading(messageId: Int)
        fun hideLoading()

        fun showError(error: Error)

    }

    interface Presenter <in V : View> {

        fun onCreate(bundle: Bundle?)
        fun onResume()
        fun onStop()
        fun onDestroy()

    }

    interface Router

}