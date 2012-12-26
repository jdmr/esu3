package esu

import java.sql.Connection
import java.sql.DriverManager
import java.sql.ResultSet
import java.sql.Statement

class InicializaService {

    def editores() {
        log.info("Buscando editores")
        Map<String, String> usuarios = [:]
        Connection src
        Statement stmt
        Statement stmt2
        ResultSet rs
        ResultSet rs2
        src = DriverManager.getConnection("jdbc:postgresql:lportal","swau","5u4u")
        stmt = src.createStatement()
        rs = stmt.executeQuery("select screenname, emailaddress, firstname, middlename, lastname, createdate, password_ from user_, users_usergroups where user_.userid = users_usergroups.userid and users_usergroups.usergroupid = 27943")
        while(rs.next()) {
            Usuario usuario = new Usuario(
                    username: rs.getString('emailaddress')
                    , password: rs.getString('emailaddress')
                    , nombre: (rs.getString('middlename'))?"${rs.getString('firstname')} ${rs.getString('middlename')}":rs.getString('firstname')
                    , apellido: rs.getString('lastname')
                    , dateCreated: rs.getTimestamp('createdate')
            ).save()
            usuarios."${rs.getString('screenname')}" = rs.getString('emailaddress')
        }

        Usuario editor = Usuario.findByUsername('editor@um.edu.mx')
        stmt2 = src.createStatement()
        rs = stmt.executeQuery("select a.entryid, a.groupid, a.companyid, a.userid, a.username, a.createdate, a.classpk, a.title, a.viewcount, d.screenname from assetentry a, assetentries_assettags b, assettag c, user_ d where a.entryid = b.entryid and b.tagid = c.tagid and a.userid = d.userid and classnameid = 10084 and a.companyid = 15686 order by a.createdate, a.entryid")
        Map<String, String> entries = [:]
        while(rs.next()) {
            if (!entries.containsKey(rs.getString('entryid'))) {
                rs2 = stmt2.executeQuery("select a.title, a.description, a.content, a.createdate, a.modifieddate from journalarticle a where a.resourceprimkey = "
                        + rs.getLong("classpk")+ " order by a.modifieddate desc")
                String correoAutor = usuarios.get(rs.getString('screenname'))
                log.debug("Autor $correoAutor")
                if (correoAutor) {
                    Usuario autor = Usuario.findByUsername(correoAutor)
                    String titulo
                    String descripcion
                    String contenido
                    Map<String, List<String>> tags = [:]
                    if (rs2.next()) {
                        titulo = rs2.getString('title')
                        descripcion = rs2.getString('description')
                        contenido = rs2.getString('content')
                        int p1 = contenido.indexOf("<![CDATA[")
                        int p2 = contenido.lastIndexOf("]]>")
                        if (p1 >= 0) {
                            contenido = contenido.substring(p1 + 9, p2)
                        }

                        if (contenido) {
                            rs2 = stmt2.executeQuery("select a.name from assettag a, assetentries_assettags b where a.tagid = b.tagid and b.entryid = " + rs.getLong("entryid"))
                            while(rs2.next()) {
                                String tag = rs2.getString('name')
                                if (tag.equals('comunica')
                                        || tag.equals('dialoga')
                                        || tag.equals('versiculo')) {
                                    tags.'tipo' = [tag]
                                } else if (tag.equals('domingo')
                                        || tag.equals('lunes')
                                        || tag.equals('martes')
                                        || tag.equals('miercoles')
                                        || tag.equals('jueves')
                                        || tag.equals('viernes')
                                        || tag.equals('sabado')) {
                                    tags.'dia' = [tag]
                                    tags.'tipo' = ['leccion']
                                } else if (tag.startsWith('tema')) {
                                    tags.'tema' = [tag]
                                } else if (tag.startsWith('2')) {
                                    tags.'anio' = [tag]
                                } else if (tag.startsWith('l')) {
                                    def x = tags.get('leccion')
                                    if (x) {
                                        x << tag
                                        log.debug('Publicado mas de una vez')
                                        log.debug("$x : $tags")
                                    } else {
                                        tags.'leccion' = [tag]
                                    }
                                } else if (tag.startsWith('t')) {
                                    tags.'trimestre' = [tag]
                                }
                            }
                        }
                    }

                    log.debug("${rs.getString('entryid')} $titulo TAGS $tags ${contenido?.length()}")

                    boolean esArticulo = false
                    if (tags.'anio'
                            && tags.'trimestre'
                            && tags.'tipo') {
                        Articulo articulo = new Articulo(
                                titulo: titulo
                                , contenido: contenido
                                , descripcion: descripcion
                                , autor: autor
                                , vistas: rs.getInt('viewcount')
                        ).save(flush: true)

                        for(String x in tags.'leccion') {
                            log.debug("DIA: ${tags.'dia'}")
                            Publicacion publicacion = new Publicacion(
                                    anio: tags.'anio'[0]
                                    , trimestre: tags.'trimestre'[0]
                                    , leccion: x
                                    , tipo:  tags.'tipo'[0]
                                    , tema: (tags.'tema')?tags.'tema'[0]:null
                                    , dia: (tags.'dia')?tags.'dia'[0]:null
                                    , es: articulo
                                    , editor: editor
                            ).save(flush: true)

                            if (publicacion.tipo.equals('comunica') || publicacion.tipo.equals('dialoga')) {
                                autor.publicaciones = autor.publicaciones + 1
                                esArticulo = true
                            }

                        }

                        if (esArticulo) {
                            autor.articulos = autor.articulos + 1
                            autor.save(flush: true)
                        }
                    }
                }

                entries.put(rs.getString('entryid'),rs.getString('entryid'))
            }
        }
    }
}
