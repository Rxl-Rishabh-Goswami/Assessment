package assessment

import grails.gorm.transactions.Transactional

@Transactional
class ReadingItemService {
    def itemRead(User user, Resource resource) {
        ReadingItem readingItem = ReadingItem.findByUserAndResource(user, resource)
        readingItem.isRead = true
        user.addToReadingitems(readingItem)
        resource.addToReadingitems(readingItem)
        readingItem.save(flush: true, failOnError: true)
        return readingItem

    }

}
