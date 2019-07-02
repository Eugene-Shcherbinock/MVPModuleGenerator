package ${baseModulePackage}

import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.Context
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import ${packageName}.R
import java.lang.Error

abstract class ${baseModulePrefix}ModuleFragment<in V : ${baseModulePrefix}Contracts.View, P : ${baseModulePrefix}Contracts.Presenter<V>>
    : Fragment(), ${baseModulePrefix}Contracts.View {

    /**
     * Properties
     */

    protected abstract var presenter: P
    protected abstract var toolbarTitle: String
    protected abstract var contentLayoutId: Int

    private lateinit var progressDialog: ProgressDialog

    protected var toolbarHandler: ToolbarHandlerType? = null

    override fun onAttach(context: Context?) {
        super.onAttach(context)
        toolbarHandler = context as? ToolbarHandlerType
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(contentLayoutId, container, false)
        updateViewDependencies(view)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        presenter.onCreate(savedInstanceState)
    }

    override fun getContext(): Context {
        return super.getContext()!!
    }

    override fun onResume() {
        super.onResume()
        presenter.onResume()
    }

    override fun onStop() {
        super.onStop()
        presenter.onStop()
    }

    override fun onDestroy() {
        super.onDestroy()
        presenter.onDestroy()
    }

    /**
     * ${baseModulePrefix}Contracts.View
     */

    override fun showLoading(message: String) {
        if (progressDialog.isShowing) {
            progressDialog.dismiss()
        }

        progressDialog.setMessage(message)
        progressDialog.show()
    }

    override fun showLoading(messageId: Int) {
        showLoading(getString(messageId))
    }

    override fun hideLoading() {
        if (progressDialog.isShowing) {
            progressDialog.dismiss()
        }
    }

    override fun showError(error: Error) {
        AlertDialog.Builder(context)
            .setMessage(error.localizedMessage)
            .setCancelable(false)
            .show()
    }

    /**
     * Protected Methods
     */

    protected open fun updateViewDependencies(view: View) {
        updateToolbarDependencies()

        progressDialog = ProgressDialog(context)
        progressDialog.setCancelable(false)
        progressDialog.isIndeterminate = true
    }

    /**
     * Private Methods
     */

    private fun updateToolbarDependencies() {
        toolbarHandler?.let {
            it.setToolbarTitle(toolbarTitle)
        }
    }

}
