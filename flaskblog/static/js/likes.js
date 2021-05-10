$(function(){

    $('.like-btn').on('click',function(){
        
        let myBtn = this;
        console.log(myBtn);
        let action = myBtn.getAttribute('action');
        $.ajax({
            url:`/add_likes`,
            method:'GET',
            data:{
                post_id:myBtn.value,
                action:action
            },
            success:function(response){
                
                console.log(response)
                
                // for(i in myBtn){
                //     console.log(i, myBtn[i]);
                // }
                 myBtn.nextElementSibling.outerHTML = `<span class="count">${response.count}</span>`;

                if(response.action == 'like'){
                    myBtn.className = 'like-btn btn btn-danger';
                    myBtn.setAttribute('action','dislike')
                    myBtn.innerHTML = 'Dislike';
                }
                else if(response.action == 'dislike'){
                    myBtn.className = 'like-btn btn btn-primary';
                    myBtn.innerHTML = 'like';
                    myBtn.setAttribute('action','like')

                }
                
                            
            }
        })
        
    });

})

