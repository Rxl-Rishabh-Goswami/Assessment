package assessment

import grails.gorm.transactions.Transactional

import java.awt.List

@Transactional
class RecentPostsService {
    def recent(){
        List topic = Resource.createCriteria().list(max:5,offset:0){
            order('dateCreated','desc')
        }
        return
    }

}
