package assessment

class ReadingItemController {
    ReadingItemService readingItemService

    def isRead() {
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as long
        Resource resource = Resource.findWhere(id: resourceID)
        ReadingItem readingItem = readingItemService.itemRead(user, resource)
        redirect(controller: 'login', action: 'dashboard')
    }

}
