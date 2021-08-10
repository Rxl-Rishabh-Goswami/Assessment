package assessment

import assessment.dto.PostDto
import grails.converters.JSON




class ResourcesController {
    PostService postService
    def index() {
        User user = User.findWhere(username: session.username)
        List topic = Topic.list()
        def resourceID = params.resourceID as Long
        Resource resource = Resource.findWhere(id: resourceID)
        ResourceRating rr = ResourceRating.findByUserAndResource(user,resource)
        if(rr){
            def userRate = rr.score
            render(view: 'post',model: [user:user,resource:resource,topic:topic,userRate:userRate])

        }
        else{
            render(view: 'post',model: [user:user,resource:resource,topic:topic])
        }
    }
    def indexAfterChange(String resourceID){
        User user = User.findWhere(username: session.username)
        List topic = Topic.list()
        def ID = resourceID as Long
        Resource resource = Resource.findWhere(id: ID)
        ResourceRating rr = ResourceRating.findByUserAndResource(user,resource)
        if(rr){
            def userRate = rr.score
            render(view: 'post',model: [user:user,resource:resource,topic:topic,userRate:userRate])

        }
        else{
            render(view: 'post',model: [user:user,resource:resource,topic:topic])
        }




    }
    def createDocument(){
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.findWhere(name: params.topicDocument)
        DocumentResource dr = new DocumentResource()
        dr.description = params.documentDescription
        def doc = request.getFile("document")
        String origin = doc.getOriginalFilename()
        if (origin) {
            File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/documents/${user.username}_${topic.id}_${origin}")
            doc.transferTo(file)
            dr.filePath =file.path
        }
        user.addToResources(dr)
        topic.addToResources(dr)
        dr = dr.save(flush:true,failOnError:true)
        for(Subscription s:topic.subscriptions){
            if(s.user!=user) {
                ReadingItem ri = new ReadingItem()
                ri.isRead = false
                ri.user = s.user
                ri.resource = dr
                ri.save(flush: true, failOnError: true)
            }

        }


//        user.addToReadingitems(ri)
//        dr.addToReadingitems(ri)
//        ri.save(flush:true,failOnError:true)
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
        lr=lr.save(flush:true,failOnError:true)
        for(Subscription s: topic.subscriptions) {
            if(s.user!=user) {
                ReadingItem ri = new ReadingItem()
                ri.isRead = false
                ri.resource = lr
                ri.user = s.user
                ri.save(flush: true, failOnError: true)
            }
        }
        flash.createLink = "Link Resource Added to topic: ${params.topicLink}"
        redirect(controller:'login',action:'dashboard')
    }
    def downloadDocument(){
        Resource download = Resource.get(params.id)
        String pathDownload = download.filePath
        def file = new File(pathDownload)

        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.path}")
            response.outputStream << file.bytes
        }
        else{
            redirect(controller:"login",action: "dashboard")
        }
    }
    def adminPost(){
        def allResource = Resource.list()
        User user = User.findWhere(username:session.username)
        render(view: 'adminResource',model: [user: user, allResource:allResource])
    }
    def deleteResource(){
        def resourceID = params.resourceID as Long
        Resource resource = Resource.get(resourceID)
        resource.delete(flush:true,failOnError:true)
        redirect(action: 'adminPost')
    }
    def resourceEdit(){
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as Long
        Resource r = Resource.get(resourceID)
        if(params.newDescription){
            r.description = params.newDescription
        }
        if(params.newFile.size !=0){
            def doc = request.getFile("newFile")
            String origin = doc.getOriginalFilename()
            if (origin) {
                File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/documents/${user.username}_${r.topic.id}_${origin}")
                doc.transferTo(file)
                r.filePath =file.path
            }
        }
        if(params.newUrl){
            r.linkurl = params.newUrl
        }
        r.save(flush:true,failOnError:true)
        redirect(action: 'indexAfterChange',params:[resourceID:resourceID])
    }
    def recentPost(){
        List recent = postService.recent()
        List<PostDto> recentDetails = []
        recent.each {
            recentDetails << new PostDto(firstName: it.user.firstName,lastName: it.user.lastName,username: it.user.username,photo: it.user.photo,description: it.description,name: it.topic.name)
        }
        render(recentDetails as JSON)
    }
    def topPost(){
        List top = postService.top()
        List<PostDto> topDetails = []
        top.each {
            topDetails << new PostDto(firstName: it.user.firstName,lastName: it.user.lastName,username: it.user.username,photo: it.user.photo,description: it.description,name: it.topic.name)
        }
        render(topDetails as JSON)
    }

}
