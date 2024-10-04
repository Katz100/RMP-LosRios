_

<h1><b>Collaboration</b></h1>

<ol>
  <li>Use Qt Creator to clone this repo.</li>
  <li>Add the header file, config.h, if necessary.</li>
  <li>Add a remote repository to your project. Tools > git > Remote Repository > Manage Remotes
  <li>Install PostgreSQL 16. (If you need to use class methods from database.h)</li>
  <li>Add these directories to your Path variables.</li>
  <pre><code>C:\Program Files\PostgreSQL\16\bin</code></pre>
  <pre><code>C:\Program Files\PostgreSQL\16\include</code></pre>
  <pre><code>C:\Program Files\PostgreSQL\16\lib</code></pre>
  <li>Create a new branch. Choose a name describing what you're working on.</li>
  <pre><code>git branch &lt;branch-name&gt;</code></pre>
  <li>Move to your new branch.</li>
  <pre><code>git checkout &lt;branch-name&gt;</code></pre>
  <li>Commit changes to your new branch.</li>
  <li>Push commits to your new branch.</li>
  <pre><code>git push origin &lt;branch-name&gt;</code></pre>
  <li>Or if there is no remote branch.</li>
  <pre><code>git push --set-upstream origin &lt;branch-name&gt;</code></pre>
  <li>Create a new pull request when you're ready.</li>
</ol>

<h1>Documentation</h1>
<details>
<summary>database.h methods</summary>
<h2>bool connectToDatabase()</h2>
<p>Attempts to connect to the database and returns <strong>true</strong> if the connection is successful; otherwise, returns <strong>false</strong>.</p>

<h2>bool isConnected()</h2>
<p>Returns <strong>true</strong> if the database connection is open; otherwise, returns <strong>false</strong>.</p>

<h2>QString username() const</h2>
<p>Gets the current username.</p>

<h2>void setUsername(const QString &newUsername)</h2>
<p>Sets a new username and emits the <strong>usernameChanged()</strong> signal if the value has changed.</p>

<h2>bool loggedIn() const</h2>
<p>Returns whether the user is currently logged in.</p>

<h2>void setLoggedIn(bool newloggedIn)</h2>
<p>Updates the logged-in status and emits the <strong>loggedInChanged()</strong> signal if the status changes.</p>

<h2>QString hashPassword(const QString &password)</h2>
<p>Hashes the input password using MD5 and returns the hashed result.</p>

<h2>bool validateLogin(const QString &username, const QString &password)</h2>
<p>Checks the database to validate whether the provided username and password are correct.</p>

<h2>void loginUser(const QString &username)</h2>
<p>Sets the username and marks the user as logged in.</p>

<h2>bool isUsernameTaken(const QString &username)</h2>
<p>Checks if the provided username is already taken in the database.</p>

<h2>void registerUser(const QString &username, const QString &password, const QString &salt)</h2>
<p>Registers a new user with the provided username, hashed password, and salt, and assigns the default user role.</p>

<h2>void logout()</h2>
<p>Logs the current user out by resetting the username to "Guest" and marking the user as logged out.</p>

<h2>int getSchoolId()</h2>
<p>Returns the school ID associated with the logged-in user.</p>

<h2>int countTeacherRatings(int teacher_id)</h2>
<p>Returns the count of ratings associated with the specified teacher ID.</p>

<h2>int getRatings(int teacher_id, int rating_number)</h2>
<p>Gets the number of ratings for a specific teacher ID with the provided rating number (quality rating).</p>

<h2>double getAverageRating(int teacher_id)</h2>
<p>Returns the average quality rating of a specific teacher, rounded to one decimal place.</p>

<h2>double getAverageDifficulty(int teacher_id)</h2>
<p>Returns the average difficulty rating of a specific teacher, rounded to one decimal place.</p>

<h2>void changeUsername(const QString &new_username)</h2>
<p>Changes the username of the currently logged-in user to the provided new username.</p>

<h2>void setSchool(int id)</h2>
<p>Associates the current user with a specified school ID and updates it if a conflict arises.</p>

<h2>int getUserId()</h2>
<p>Returns the ID of the currently logged-in user.</p>

<h2>void deleteUser()</h2>
<p>Deletes the currently logged-in user from the database.</p>

<h2>QString getTeacher(int id)</h2>
<p>Returns the name of the teacher corresponding to the provided teacher ID.</p>

<h2>QString getCourse(int id)</h2>
<p>Returns the name of the course corresponding to the provided course ID.</p>

<h2>QString generateSalt()</h2>
<p>Generates and returns a random salt value for password hashing.</p>

<h2>QString getUserSalt(const QString &username)</h2>
<p>Retrieves the salt associated with the provided username.</p>

<h2>QVariantList getUserReviews()</h2>
<p>Returns a list of reviews created by the currently logged-in user.</p>

<h2>QVariantList getTeacherReviews(int teacher_id)</h2>
<p>Returns a list of reviews for a specific teacher identified by the provided teacher ID.</p>

<h2>QVariantList getTeachers(const QString &teacher_name)</h2>
<p>Returns a list of teachers whose names match or partially match the provided teacher name.</p>

<h2>QVariantList getCurrentSuggestions()</h2>
<p>Returns the current suggestions for teacher names, based on a previously generated list.</p>

<h2>void getTeacherNameSuggestions()</h2>
<p>Queries the database to retrieve all teacher names and stores them for suggestion purposes.</p>

<h2>void updateCurrentSuggestions(const QString &word)</h2>
<p>Updates the current list of suggestions to include only those names that start with the provided word, case insensitive.</p>

<h2>bool connected() const</h2>
<p>Returns <strong>true</strong> if the database connection is active, <strong>false</strong> otherwise.</p>

<h2>void setConnected(bool newConnected)</h2>
<p>Sets the connection status of the database and emits the <strong>connectedChanged()</strong> signal if the value changes.</p>
</details>
