

# was part of the GymnastAdmin.  Removed both because needs to be updated and not sure is necessary now that we are using the USAG reservation system plus csv import.
#     actions.insert(0, ('verify_with_usag', (self.verify_with_usag, 'verify_with_usag', 'Verify USAG info')))

# def verify_with_usag(self, modeladmin, request, queryset):
#     credentials = {
#         'user': settings.USAG_USER,
#         'pass': settings.USAG_PASS
#     }

#     members = []
#     for member in queryset:
#         if member.usag:
#             members.append(member.usag)
#         else:
#             member.notes = 'missing usag id'
#             member.is_flagged = True
#             member.save()

#     usag_max = settings.USAG_MAX_VERIFY
#     chunks = [members[x:x + usag_max] for x in range(0, len(members), usag_max)]

#     verified_count = 0
#     failed_count = 0

#     with requests.Session() as s:
#         login = s.post(settings.USAG_LOGIN_URL, credentials)

#         if login.status_code == 200:
#             for chunk in chunks:

#                 member_data = settings.USAG_VERIFY_DATA.copy()
#                 member_data['memNumbers'] = ','.join(chunk)

#                 r = s.post(settings.UASG_VERIFY_URL, member_data)
#                 s.headers.update({'Accept': 'application/json, text/javascript, */*;'})

#                 try:
#                     rows = r.json()['aaData']
#                     print('rows {}'.format(rows))

#                     for row in rows:
#                         division = level_division = ''
#                         (usag_id, last_name, first_name, dob, member_type, level, club_id, club, club_status, status) = row

#                         # WARNING! this bit is fragile and subject to enfuckage
#                         # handles jd level
#                         if len(level) == 2:
#                             pass
#                         else:
#                             # handles the old way of USAG levels, MLEVEL10
#                             try:
#                                 level = int(level[6:])
#                             except Exception:
#                                 # handles the new way of USAG levels with divisions M7D1
#                                 try:
#                                     division = level[-2:]
#                                     level = level[:-2]
#                                     level = level[1:]
#                                     level_division = '{}{}'.format(level, division)
#                                 except Exception:
#                                     level = None

#                         dob = parser.parse(dob).date()

#                         try:
#                             gymnast = models.Gymnast.objects.get(usag=usag_id)
#                             notes = ""
#                             valid = True
#                             # print('*** {} and {} and {}'.format(str(gymnast.level.group), "".join(gymnast.level.name.split()).lower(), '{}{}'.format(level, division.lower()) ))

#                             if last_name.lower() != gymnast.last_name.lower():
#                                 valid = False
#                                 notes += "Last name does not match USAG last name (USAG: {})\n".format(last_name)

#                             if dob != gymnast.dob:
#                                 valid = False
#                                 notes += "Date of birth does not match USAG date of birth (USAG: {})\n".format(dob)

#                             if str(level).lower() != str(gymnast.level.group).lower():
#                                 valid = False
#                                 notes += "Level does not match USAG level (USAG: {})\n".format(level)

#                             if level_division and level_division.lower() != "".join(gymnast.level.name.split()).lower():
#                                 valid = False
#                                 notes += "Compulsory division does not match USAG level (USAG: {})\n".format(level_division)

#                             if status.lower() != 'active':
#                                 valid = False
#                                 notes += "USAG member is not active (USAG: {})\n".format(status)

#                             gymnast.notes = notes
#                             gymnast.is_verified = valid
#                             gymnast.is_flagged = not valid
#                             gymnast.save()

#                             if (valid):
#                                 verified_count += 1
#                             else:
#                                 failed_count += 1

#                         except Exception:
#                             failed_count += 1

#                 except Exception:
#                     messages.error(request, 'Could not parse data from USAG verification service!')
#             messages.success(request, 'Verified {} gymnasts, flagged {} gymnasts for review'.format(verified_count, failed_count))
#         else:
#             messages.error(request, 'Could not connect with USAG verification service. Check credentials.')
# verify_with_usag.short_description = "Verify selected gymnasts with USAG"
