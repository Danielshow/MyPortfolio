import consumer from "./consumer"
jQuery(document).on('turbolinks:load', () => {
  let comments = $('#comments')
  const commentSubscription = consumer.subscriptions.create({ 
    channel: "CommentsChannel",
    blog_id: comments[0].dataset['blogId'] },
   {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      comments.append(data['comment']) 
    },

    send_comment(comment, blog_id) {
      this.perform('send_comment', {comment: comment, blog_id: blog_id})
    }
  });

  $("#new_comment").submit((e) => {
    e.preventDefault()
    const textarea = $("#comment_content")
    console.log(textarea)
    if ($.trim(textarea.val().length)){
      commentSubscription.send_comment(textarea.val(), comments[0].dataset['blogId'])
      textarea.val('')
    }
    return false;
  })
})

