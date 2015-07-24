// GitHub API variable defaults
var reposUrl;
var repoIDs = [];
var username;
var userCommits = [];
var allCommits;

$(".users.show").ready(function() {

  // GITHUB API SCRIPT 

  var getGithubRepos = function() {

    $.getJSON(reposUrl, {
      sort: "updated",
    }).done(function(results) {

      for (var i = 0; i < 5; i++) {
        var repo = results[i].name;
        var url = results[i].html_url;
        $('<p><a href="' + url + '">' + repo + '</a></p>').appendTo('.repos');
      }

      $('<a href="https://github.com/' + username + '?tab=repositories"> >> See all repos' + '</a><br><hr>').appendTo('.repos');

      commitsUrl = "https://api.github.com/repos/" + username + "/" + results[0].name + "/commits";
      $.getJSON(commitsUrl, {}).done(function(commitResults) {

        for (var x = 0; x < 5; x++) {
          if (commitResults[x].committer !== null) {
            if (commitResults[x].committer.login === username) {
              userCommits.push("{" + repo + " : " + commitResults[x].commit.message + "}");
              var message = commitResults[x].commit.message;
              var $commitMessage = $('<p>').text(message);
              $commitMessage.appendTo('.commits')
            }
          }
        }

      })
    })

  };

  var getGithub = function() {

    username = gon.user.github_username;
    if (username === null) {
      username = "aoijwefaneaarjn"
    }
    var gitUrl = "https://api.github.com/search/users";

    $.getJSON(gitUrl, {
      q: username
    }).done(function(results) {

      console.log(results)
      if (results.total_count < 1) {
        var notice = $("<p>Either this user has not finished setting up their GAS profile or they've entered their GitHub username incorrectly (derp). </p>")
        $(notice).prependTo('.githubProfile')
      } else {

        var githubAvatarUrl = results.items[0].avatar_url;
        username = results.items[0].login;
        reposUrl = results.items[0].repos_url;
        html_url = results.items[0].html_url;

        var githubAvatar = $('<img>').addClass('miniAvatarImage img-rounded').attr('src', githubAvatarUrl);
        $(githubAvatar).prependTo('.githubProfile');
        $('<h4>Repositories</h4>').prependTo('.repos')
        $('<h4>Recent commits</h4>').prependTo('.commits')
        $('<a href="' + html_url + '"> ' + username + '</a><hr>').appendTo('.githubProfile');

        getGithubRepos();
      }
    })
  }




  // API FUNCTION CALLS
  getGithub();
});
