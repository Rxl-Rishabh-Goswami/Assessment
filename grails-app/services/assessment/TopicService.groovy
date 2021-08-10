package assessment

import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def changeVisibility(Topic topic, String str) {
        int value = str as int
        Enum pri = topic.visibility.convert(value)
        topic.visibility = pri
        topic.save(flush:true,failOnError:true)

    }


}
