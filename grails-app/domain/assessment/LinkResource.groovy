package assessment

class LinkResource extends Resource{
    String linkurl

    static constraints = {
        linkurl nullable: false, blank: false

    }
}
