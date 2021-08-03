package assessment


class ResourcesController {

    def index() {
        User user = User.findWhere(username: session.username)
        List topic = Topic.list()
        def resourceID = params.resourceID as Long
        Resource resource = Resource.findWhere(id: resourceID)
//        ReadingItem ri = ReadingItem.findByUserAndResource(user,resource)
//        ri.isRead = true
//        user.addToReadingitems(ri)
//        resource.addToReadingitems(ri)
//        ri.save(flush:true,failOnError:true)
        render(view: 'post',model: [user:user,resource:resource,topic:topic])
    }
    def createDocument(){
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.findWhere(name: params.topicDocument)
        DocumentResource dr = new DocumentResource()
        dr.description = params.documentDescription
        def doc = request.getFile("document")
        String origin = doc.getOriginalFilename()
        if (origin) {
            File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/documents/${params.username}.pdf")
            doc.transferTo(file)
            dr.filePath ="/documents/${params.username}.pdf"
        }
        user.addToResources(dr)
        topic.addToResources(dr)
        dr.save(flush:true,failOnError:true)
        flash.createDocument = "Document Resource Added to topic: ${params.topicDocument}"
        redirect(controller:'login',action:'dashboard')
    }
    def createLink(){
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.findWhere(name: params.topicLink)
        LinkResource lr = new LinkResource()
        lr.description = params.linkDescription
        lr.linkurl = params.link
        user.addToResources(lr)
        topic.addToResources(lr)
        lr.save(flush:true,failOnError:true)
        flash.createLink = "Link Resource Added to topic: ${params.topicLink}"
        redirect(controller:'login',action:'dashboard')
    }

}
