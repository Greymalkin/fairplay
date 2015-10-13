import requests

credentials = {
    'user': 'FairlandFBB',
    'pass': 'fa1rl2ndfbb'
}

check_data = {
    'sEcho': 0,
    'iColumns': 8,
    'sColumns': None,
    'iDisplayStart': 0,
    'iDisplayLength': -1,
    'iSortingCols': 2,
    'iSortCol_0': 0,
    'sSortDir_0': 'asc',
    'iSortCol_1': 1,
    'sSortDir_1': 'asc',
    'bSortable_0': True,
    'bSortable_1': True,
    'bSortable_2': True,
    'bSortable_3': True,
    'bSortable_4': True,
    'bSortable_5': True,
    'bSortable_6': True,
    'bSortable_7': True,
    'program': 2,
    'type': 'athlete',
    'show': 'all',
    'memNumbers': '482708,372142',
}

login_url = 'https://usagym.org/fw/login.html'
verify_url = 'https://usagym.org/app/sanctionDetailVerifyWS.html'

with requests.Session() as s:
    login = s.post(login_url, credentials)

    r = s.post(verify_url, check_data)
    s.headers.update({'Accept': 'application/json, text/javascript, */*;'})
    print(r.text)



# <form action="/fw/login.html?url=/pages/membership/pages/membership_overview.html" method="post">

#     <div style="float: left; width: 50%;">
#       <div class="spacer">
#     <h2>Have you registered?</h2>

#     <div>Registering a username and password on USA Gymnastics gives you access to new and upcoming features within our website. By registering you will have access to membership features which will let you update or renew your membership. Register today by clicking below on the link!
#     </div>

#     <div>
#       <a href="/fw/register.html" style="margin-right: 25px; font-weight: bold; font-size: 17px;">Click Here To Register</a>
#     </div>
#       </div><!--end spacer-->
#     </div><!--end 50percentDiv-->

#     <div style="float: left; width: 50%;">
#       <div class="spacer">
#     <h2>Log In</h2>

#     <table class="form">
#       <tbody>
#         <tr>
#           <th>Username</th>
#           <td><input type="text" style="width: 150px;" maxlength="20" name="user" value=""></td>
#         </tr>

#         <tr>
#           <th>Password</th>
#           <td><input type="password" style="width: 150px;" maxlength="255" password="1" name="pass"></td>
#         </tr>

#         <tr>
#           <th colspan="2" style="text-align: center; padding: 5px;">
#         <label>
#           <input type="checkbox" name="autologin" value="true" checked="checked">
#           Keep me logged in
#         </label>
#           </th>
#         </tr>
#       </tbody>
#     </table>

#     <div>
#       <a href="/fw/forgotPassword.html" style="margin-right: 25px; font-weight: bold;">Forgot your password?</a>
#     </div>
#       </div><!--end spacer-->
#     </div><!--end 50percent-->
#   </form>
