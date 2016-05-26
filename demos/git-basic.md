# Demo: Basic Git

```
~ $ mkdir portfolio
~ $ cd portfolio
~/portfolio $ atom book.txt
~/portfolio $ ls
book.txt
~/portfolio $ git init
Initialized empty Git repository in /Users/selassid/portfolio/.git/
~/portfolio $ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	book.txt

nothing added to commit but untracked files present (use "git add" to track)
~/portfolio $ git add book.txt
~/portfolio $ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   book.txt

~/portfolio $ git commit
[master (root-commit) c79b61e] Adds first draft of book.
 1 file changed, 1 insertion(+)
 create mode 100644 book.txt
~/portfolio $ git status
On branch master
nothing to commit, working directory clean
~/portfolio $ git log
commit c79b61ec5ff2e2958d58d7733d1d43e726849c6c
Author: David Selassie <selassid@gmail.com>
Date:   Thu May 26 12:30:21 2016 -0700

    Adds first draft of book.
~/portfolio $ atom book.txt
~/portfolio $ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   book.txt

no changes added to commit (use "git add" and/or "git commit -a")
~/portfolio $ git add book.txt
~/portfolio $ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   book.txt

~/portfolio $ git reset book.txt
Unstaged changes after reset:
M	book.txt
~/portfolio $ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   book.txt

no changes added to commit (use "git add" and/or "git commit -a")
~/portfolio $ git diff
diff --git a/book.txt b/book.txt
index ddff707..1bef1bd 100644
--- a/book.txt
+++ b/book.txt
@@ -1 +1,3 @@
-This is my awesome book!
+This is my book!
+
+It's going to have a lot of content.
~/portfolio $ git add book.txt
~/portfolio $ git commit
[master e193696] Revises my book.
 1 file changed, 3 insertions(+), 1 deletion(-)
~/portfolio $ git log
commit e193696e4ba1d55a77eed26da343859175b2f6b9
Author: David Selassie <selassid@gmail.com>
Date:   Thu May 26 13:29:32 2016 -0700

    Revises my book.

commit c79b61ec5ff2e2958d58d7733d1d43e726849c6c
Author: David Selassie <selassid@gmail.com>
Date:   Thu May 26 12:30:21 2016 -0700

    Adds first draft of book.
~/portfolio $ git remote add origin https://github.com/selassid/portfolio.git
~/portfolio $ git remote -v
origin	https://github.com/selassid/portfolio.git (fetch)
origin	https://github.com/selassid/portfolio.git (push)
~/portfolio $ git push --set-upstream origin master
Counting objects: 6, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (6/6), 516 bytes | 0 bytes/s, done.
Total 6 (delta 0), reused 0 (delta 0)
To https://github.com/selassid/portfolio.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.
~/portfolio $ atom book.txt
~/portfolio $ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   book.txt

no changes added to commit (use "git add" and/or "git commit -a")
~/portfolio $ git add book.txt
~/portfolio $ git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   book.txt

~/portfolio $ git commit
[master 3680ba1] Realistic book summary.
 1 file changed, 1 insertion(+), 1 deletion(-)
~/portfolio(master) % git push
Counting objects: 3, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (1/1), done.
Writing objects: 100% (3/3), 301 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/selassid/portfolio.git
   e193696..3680ba1  master -> master
```