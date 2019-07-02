package ${baseModulePackage}

import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.Context
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import ${packageName}.R

abstract class ${baseModulePrefix}ModuleActivity <in V : ${baseModulePrefix}Contracts.View, P : ${baseModulePrefix}Contracts.Presenter<V>>
    : AppCompatActivity(), ${baseModulePrefix}Contracts.View {

    /**
     * Properties
     */

    protected abstract var presenter: P
    protected abstract var contentLayoutId: Int

    private lateinit var progressDialog: ProgressDialog

    
    /**
     * Lifecycle
     */

    override fun onCreate(savedInstanceState: Bundle?) {
        configureModule()

        super.onCreate(savedInstanceState)
        setContentView(contentLayoutId)

        updateViewDependencies()

        presenter.onCreate(savedInstanceState)
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

    override fun getContext(): Context = this

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
        AlertDialog.Builder(this)
            .setMessage(error.localizedMessage)
            .setCancelable(false)
            .show()
    }

    /**
     * Protected Methods
     */

    protected open fun updateViewDependencies() {
        progressDialog = ProgressDialog(getContext())
        progressDialog.setCancelable(false)
        progressDialog.isIndeterminate = true
    }

    protected abstract fun configureModule()

}
