package assessment

class SearchController {
//    SearchService searchService
PostService postService

    def searchPage(){
        User user = User.findWhere(username: session.username)
        String searchKey = params.searchKey
        String key = '%'+searchKey+'%'
        List recent = postService.recent()
        List searchPost = Resource.createCriteria().list() {
                ilike('description',key)
        }
        render(view: 'Search',model: [user:user,searchPost:searchPost,searchKey: searchKey,recent:recent])
    }
}
