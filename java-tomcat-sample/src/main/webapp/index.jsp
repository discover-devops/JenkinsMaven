<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facebook Page JavaScript</title>
</head>
<body>
    <script>
        // JavaScript code to be embedded into a Facebook page
        function greetUser() {
            var userName = prompt("enter your name:");
            if (userName != null && userName != "") {
                alert("Hello, " + userName + "! Welcome to our Facebook page!");
            }
        }

        // Example usage
        greetUser();
    </script>
</body>
</html>
