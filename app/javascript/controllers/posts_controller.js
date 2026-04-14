import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['posts', 'frame','toggleBtn', 'commentSection']
    static values = {currentPage: String,}
    connect() {
        // console.log("the current Page-url value: ", )
        // console.log("current target: ", this)
        // this.hasCommentSectionTarget ? console.log("this is the comments section") : null
    }
    show(){
        this.hasPostsTarget ? console.log("wow there are posts") : console.log("wow there are not posts/")

    }
    toggleBtnTargetConnected(){

    }
    commentSectionTargetConnected(){
        console.log("comment section page, ", this.currentPageValue)
        const isRoot = this.currentPageValue === "/"
        this.toggleBtnTarget.textContent = isRoot ? "Show Comments": "Comment"
    }

    commentSectionTargetDisconnected(){
       console.log("The controller has disconnected")

    }

        switch_partial(event){
    // const url = event.currentTarget.dataset.url;
    const frame = document.getElementById("post_ad")
        if(this.hasFrameTarget){
            console.log("partial targeted: ", this.frameTarget)
            // this.frameTarget.src == '/posts' ? this.frameTarget.src ='/comments': this.frameTarget.src ='/posts'
        }
        else{
            console.log("this is not partial frame to target: ", this.frameTarget)

        }
        if(frame && this.currentPageValue){
            console.log("frame: ",frame)
            console.log("url: ",this.currentPageValue)
            frame.src = this.currentPageValue

        }
    }
    toggleComment(){
        this.commentSectionTarget.classList.toggle("d-none")

    }
}