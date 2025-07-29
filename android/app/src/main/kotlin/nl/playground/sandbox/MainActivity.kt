package nl.playground.sandbox

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import java.util.logging.Logger

class MainActivity : FlutterFragmentActivity() {
    private val TAG = "MainActivity"
    private val LOGGER = Logger.getLogger(MainActivity::class.java.name)

    override fun onCreate(savedInstanceState: Bundle?) {
        if (Build.VERSION.SDK_INT == Build.VERSION_CODES.O) {
            setTheme(R.style.AppCompatTheme)
        } else {
            setTheme(R.style.LaunchTheme)
        }

        super.onCreate(savedInstanceState)
    }

}
