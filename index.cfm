<cfset userService = createObject("component", "UserService")>
<cfset QPersonList = userService.getPersonList(personID="72211,72036,72322,71547,72343,72585")>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Overlapping Profile Stack</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">

</head>
<body>

<div class="container mt-4">
    <h5 class="mb-3">Selected Profiles</h5>
    
    <div class="avatar-stack" id="imageGallery">
        <cfoutput query="QPersonList">
            <cfset currentImage = "">
            <cfif len(trim(QPersonList.ImageData))>
                <cfset currentImage = reReplace(QPersonList.ImageData, "\s+", "", "all")>
            </cfif>

            <div class="tile-inner" id="img_#QPersonList.PersonID#">
                <cfif len(currentImage)>
                    <img src="data:image/jpeg;base64,#currentImage#" 
                         class="tile-image-area" 
                         alt="Profile"
                         title="#encodeForHtml(QPersonList.FName & ' ' & QPersonList.LName)#">
                <cfelse>
                    <div class="tile-image-area d-flex align-items-center justify-content-center bg-light">
                         <i class="fa-solid fa-circle-user text-secondary"></i>
                    </div>
                </cfif>
            </div>
        </cfoutput>
    </div>

    <hr class="my-4">

    <div class="row">
        <div class="col-md-5">
            <h6 class="text-muted mb-3">Resident List</h6>
            <cfoutput query="QPersonList">
                <div class="form-check mb-3">
                    <input class="form-check-input img-toggle" type="checkbox" value="#QPersonList.PersonID#" id="check_#QPersonList.PersonID#">
                    <label class="form-check-label" for="check_#QPersonList.PersonID#" style="cursor:pointer;">
                        <span class="badge bg-secondary me-2">#QPersonList.PersonID#</span> 
                        <strong>#QPersonList.FName# #QPersonList.LName#</strong>
                    </label>
                </div>
            </cfoutput>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('.img-toggle').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const personId = this.value;
            const targetTile = document.getElementById('img_' + personId);
            
            if (this.checked) {
                targetTile.style.display = 'block';
            } else {
                targetTile.style.display = 'none';
            }
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>