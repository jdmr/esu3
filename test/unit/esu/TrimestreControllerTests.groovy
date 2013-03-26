package esu



import org.junit.*
import grails.test.mixin.*

@TestFor(TrimestreController)
@Mock(Trimestre)
class TrimestreControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/trimestre/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.trimestreInstanceList.size() == 0
        assert model.trimestreInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.trimestreInstance != null
    }

    void testSave() {
        controller.save()

        assert model.trimestreInstance != null
        assert view == '/trimestre/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/trimestre/show/1'
        assert controller.flash.message != null
        assert Trimestre.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/trimestre/list'

        populateValidParams(params)
        def trimestre = new Trimestre(params)

        assert trimestre.save() != null

        params.id = trimestre.id

        def model = controller.show()

        assert model.trimestreInstance == trimestre
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/trimestre/list'

        populateValidParams(params)
        def trimestre = new Trimestre(params)

        assert trimestre.save() != null

        params.id = trimestre.id

        def model = controller.edit()

        assert model.trimestreInstance == trimestre
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/trimestre/list'

        response.reset()

        populateValidParams(params)
        def trimestre = new Trimestre(params)

        assert trimestre.save() != null

        // test invalid parameters in update
        params.id = trimestre.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/trimestre/edit"
        assert model.trimestreInstance != null

        trimestre.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/trimestre/show/$trimestre.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        trimestre.clearErrors()

        populateValidParams(params)
        params.id = trimestre.id
        params.version = -1
        controller.update()

        assert view == "/trimestre/edit"
        assert model.trimestreInstance != null
        assert model.trimestreInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/trimestre/list'

        response.reset()

        populateValidParams(params)
        def trimestre = new Trimestre(params)

        assert trimestre.save() != null
        assert Trimestre.count() == 1

        params.id = trimestre.id

        controller.delete()

        assert Trimestre.count() == 0
        assert Trimestre.get(trimestre.id) == null
        assert response.redirectedUrl == '/trimestre/list'
    }
}
