package esu



import org.junit.*
import grails.test.mixin.*

@TestFor(ArticuloController)
@Mock(Articulo)
class ArticuloControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/articulo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.articuloInstanceList.size() == 0
        assert model.articuloInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.articuloInstance != null
    }

    void testSave() {
        controller.save()

        assert model.articuloInstance != null
        assert view == '/articulo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/articulo/show/1'
        assert controller.flash.message != null
        assert Articulo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/articulo/list'

        populateValidParams(params)
        def articulo = new Articulo(params)

        assert articulo.save() != null

        params.id = articulo.id

        def model = controller.show()

        assert model.articuloInstance == articulo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/articulo/list'

        populateValidParams(params)
        def articulo = new Articulo(params)

        assert articulo.save() != null

        params.id = articulo.id

        def model = controller.edit()

        assert model.articuloInstance == articulo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/articulo/list'

        response.reset()

        populateValidParams(params)
        def articulo = new Articulo(params)

        assert articulo.save() != null

        // test invalid parameters in update
        params.id = articulo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/articulo/edit"
        assert model.articuloInstance != null

        articulo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/articulo/show/$articulo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        articulo.clearErrors()

        populateValidParams(params)
        params.id = articulo.id
        params.version = -1
        controller.update()

        assert view == "/articulo/edit"
        assert model.articuloInstance != null
        assert model.articuloInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/articulo/list'

        response.reset()

        populateValidParams(params)
        def articulo = new Articulo(params)

        assert articulo.save() != null
        assert Articulo.count() == 1

        params.id = articulo.id

        controller.delete()

        assert Articulo.count() == 0
        assert Articulo.get(articulo.id) == null
        assert response.redirectedUrl == '/articulo/list'
    }
}
