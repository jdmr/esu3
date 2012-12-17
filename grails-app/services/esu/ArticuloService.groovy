package esu

import org.hibernate.cache.impl.bridge.EntityRegionAdapter

class ArticuloService {

    def lista(params) {
        return [articulos: Articulo.list(params), total: Articulo.count()]
    }
}
