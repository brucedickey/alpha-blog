<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProfile" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Your Profile
</a>
<div class="dropdown-menu" aria-labelledby="navbarDropdownProfile">
<%= link_to "Edit your profile", edit_user_path(current_user), class: "dropdown-item" %>
<%= link_to "View your profile", user_path(current_user), class: "dropdown-item" %>

<div class="dropdown-divider"></div>
<a class="dropdown-item" href="#"> asf Something else here</a>
</div> 