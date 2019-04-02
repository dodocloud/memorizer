package cz.dodo.memorizer.services

import android.app.Application
import com.google.gson.Gson
import cz.dodo.memorizer.entities.SpeciesData
import io.reactivex.Single
import javax.inject.Inject

class CategoryServiceImpl @Inject constructor(private val app: Application, private val gson: Gson) : CategoryService {

    override fun loadAssets(): Single<SpeciesData> {
        return Single.just(true)
                .flatMap {
                    val manager = app.assets
                    val file = manager.open("data.json")
                    val formArray = ByteArray(file.available())
                    file.read(formArray)
                    file.close()

                    val str = String(formArray)
                    Single.just(gson.fromJson(str, SpeciesData::class.java))
                }
    }
}