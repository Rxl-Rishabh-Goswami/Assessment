package assessment

import assessment.dto.PostDto
import grails.converters.JSON


class ResourcesController {
    PostService postService

    def index() {
        User user = User.findWhere(username: session.username)
        if(user){
            List trendingPosts = postService.trend()
            def resourceID = params.resourceID as Long
            Resource resource = Resource.findWhere(id: resourceID)
            ResourceRating ratingOfUserForResource = ResourceRating.findByUserAndResource(user, resource)
            if (ratingOfUserForResource) {
                def userRate = ratingOfUserForResource.score
                render(view: 'post', model: [user: user, resource: resource, topic: trendingPosts, userRate: userRate])

            } else {
                render(view: 'post', model: [user: user, resource: resource, topic: trendingPosts])
            }
        }else {
            redirect(url: 'http://localhost:9091/')
        }

    }

    def createDocument() {
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.findWhere(name: params.topicDocument)
        DocumentResource documentPost = new DocumentResource()
        documentPost.description = params.documentDescription

        def doc = request.getFile("document")
        String origin = doc.getOriginalFilename()
        if (origin) {
            File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/documents/${user.username}_${topic.id}_${origin}")
            doc.transferTo(file)
            documentPost.filePath = file.path
        }
        user.addToResources(documentPost)
        topic.addToResources(documentPost)
        documentPost = documentPost.save(flush: true, failOnError: true)
        for (Subscription subscription : topic.subscriptions) {
            if (subscription.user != user) {
                ReadingItem readingItem = new ReadingItem()
                readingItem.isRead = false
                readingItem.user = subscription.user
                readingItem.resource = documentPost
                readingItem.save(flush: true, failOnError: true)
            }

        }


        flash.createDocument = "Document Resource Added to topic: ${params.topicDocument}"
        redirect(controller: 'login', action: 'dashboard')
    }

    def createLink() {
        User user = User.findWhere(username: session.username)
        Topic topic = Topic.findWhere(name: params.topicLink)
        LinkResource linkPost = new LinkResource()
        linkPost.description = params.linkDescription
        linkPost.linkurl = params.link
        user.addToResources(linkPost)
        topic.addToResources(linkPost)
        linkPost = linkPost.save(flush: true, failOnError: true)
        for (Subscription subscription : topic.subscriptions) {
            if (subscription.user != user) {
                ReadingItem readingItem = new ReadingItem()
                readingItem.isRead = false
                readingItem.resource = linkPost
                readingItem.user = subscription.user
                readingItem.save(flush: true, failOnError: true)
            }
        }
        flash.createLink = "Link Resource Added to topic: ${params.topicLink}"
        redirect(controller: 'login', action: 'dashboard')
    }

    def downloadDocument() {
        Resource download = Resource.get(params.id)
        String pathDownload = download.filePath
        def file = new File(pathDownload)

        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.path}")
            response.outputStream << file.bytes
        } else {
            redirect(controller: "login", action: "dashboard")
        }
    }

    def adminPost() {
        def allResource = Resource.list()
        User user = User.findWhere(username: session.username)
        render(view: 'adminResource', model: [user: user, allResource: allResource])
    }

    def deleteResource() {
        Long resourceID = params.resourceID as Long
        println resourceID
        Resource resource = Resource.findById(id:resourceID)
        resource.delete(flush: true, failOnError: true)
        redirect(action: 'adminPost')

    }
    def delete2(){
        Long resourceID = params.resourceID as Long
        Resource.get(resourceID).delete(flush: true)
        redirect(controller: 'login',action: 'dashboard')
    }
    def resourceEdit() {
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as Long
        Resource resource = Resource.get(resourceID)
        if (params.newDescription) {
            resource.description = params.newDescription
        }
        if (params.newFile.size != 0) {
            def doc = request.getFile("newFile")
            String origin = doc.getOriginalFilename()
            if (origin) {
                File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/documents/${user.username}_${resource.topic.id}_${origin}")
                doc.transferTo(file)
                resource.filePath = file.path
            }
        }
        if (params.newUrl) {
            resource.linkurl = params.newUrl
        }
        resource.save(flush: true, failOnError: true)
        redirect(action: 'index', params: [resourceID: resourceID])
    }

    def recentPost() {
        List recent = postService.recent()
        List<PostDto> recentDetails = []
        recent.each {
            recentDetails << new PostDto(firstName: it.user.firstName, lastName: it.user.lastName, username: it.user.username, photo: it.user.photo, description: it.description, name: it.topic.name)
        }
        render(recentDetails as JSON)
    }

    def topPost() {
        List top = postService.top()
        List<PostDto> topDetails = []
        top.each {
            topDetails << new PostDto(firstName: it.user.firstName, lastName: it.user.lastName, username: it.user.username, photo: it.user.photo, description: it.description, name: it.topic.name)
        }
        render(topDetails as JSON)
    }

}
