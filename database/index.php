<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>instagram_clone</title>
</head>
<body>
    <form action="register.php" method="post" enctype="multipart/form-data">
        <input type="text" name="user_name" id="user_name" placeholder="user name">
        <input type="file" name="profile_image" id="profile_image" placeholder="profile image">
        <input type="submit" value="Ok!">
    </form>
    <br />  
    <br />  
    <table class="table table-bordered">  
            <tr>  
                <th>Image</th>  
            </tr>  
    <?php 
    include 'conn.php';
    $query = "SELECT * FROM user ORDER BY number DESC";  
    $result = mysqli_query($conn, $query); 
    while($row = mysqli_fetch_array($result))
    {  
            echo '  
                <tr>  
                    <td>  
                        <img src="data:image/jpeg;base64,'.base64_encode($row['profile_image'] ).'" height="200" width="200" class="img-thumnail" />  
                    </td>  
                </tr>  
            ';  
    }  
    ?>  
    </table>  
</body>
</html>