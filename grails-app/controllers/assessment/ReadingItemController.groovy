package assessment

class ReadingItemController {

    def index() { }
    def isRead(){
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as long
        Resource resource = Resource.findWhere(id:resourceID)
//        ReadingItem ri = new ReadingItem()
        ReadingItem ri = ReadingItem.findByUserAndResource(user,resource)
        ri.isRead = true
        user.addToReadingitems(ri)
        resource.addToReadingitems(ri)
        ri.save(flush:true,failOnError:true)
        redirect(controller:'login', action:'dashboard')
    }

}
