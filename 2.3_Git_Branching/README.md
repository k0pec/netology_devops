k0pec@k0pec-ub:~/netology_devops$ git status
На ветке main
Ваша ветка обновлена в соответствии с «origin/main».

Неотслеживаемые файлы:
  (используйте «git add <файл>…», чтобы добавить в то, что будет включено в коммит)
	2.3_Git_Branching/

ничего не добавлено в коммит, но есть неотслеживаемые файлы (используйте «git add», чтобы отслеживать их)
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git status
На ветке main
Ваша ветка обновлена в соответствии с «origin/main».

Изменения, которые будут включены в коммит:
  (используйте «git restore --staged <файл>…», чтобы убрать из индекса)
	новый файл:    2.3_Git_Branching/branching/merge.sh
	новый файл:    2.3_Git_Branching/branching/rebase.sh

k0pec@k0pec-ub:~/netology_devops$ git commit -m 'prepare for merge and rebase'
[main 8b39c2c] prepare for merge and rebase
 2 files changed, 16 insertions(+)
 create mode 100644 2.3_Git_Branching/branching/merge.sh
 create mode 100644 2.3_Git_Branching/branching/rebase.sh
k0pec@k0pec-ub:~/netology_devops$ git log
commit 8b39c2c2dcc577b298ed5a343a5c09d671c047df (HEAD -> main)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Thu Nov 4 22:12:20 2021 +0300

    prepare for merge and rebase

commit e7078052a0abb1123322001f8692d0cff93cc31b (tag: v0.1, origin/main, origin/HEAD, gitlab/main, bitbucket/main)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Sat Oct 30 15:26:00 2021 +0300

    add text README.md

commit 9d6221225a4404b216e8e8eb33d6f84f649474ba
Merge: 0d4bdca 8ee1db6
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Sat Oct 30 15:16:25 2021 +0300

    Merge branch 'main' of github.com:k0pec/netology_devops into main

commit 0d4bdca433d047288b2512eb1d9eedc0a6479fa6 (tag: v0.0)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Sat Oct 30 14:45:44 2021 +0300

    Home Work Git Basics

commit d563316f757d0d948f1be1e27bc5268342c9059f
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Fri Oct 29 00:12:30 2021 +0300

    add root .gitignore

commit 8ee1db6455654e668b96829c121e6440b71ce576
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Fri Oct 29 00:12:30 2021 +0300

    add root .gitignore

commit f31839293fda9abdfaaa84476b31e858a7a6fade
Author: Konstantin <konstantinpe4enkin@yandex.ru>
Date:   Wed Oct 27 22:16:46 2021 +0300

    Moved and deleted

commit 5307772dc6b1a042fa0ff608f9446f3af5ec46a6
Author: Konstantin <konstantinpe4enkin@yandex.ru>
Date:   Wed Oct 27 22:11:37 2021 +0300

    Prepare to delete and move

commit 2b27a073fcf274aa0a59f6c53684a64dac3fbb11
Author: Konstantin <konstantinpe4enkin@yandex.ru>
Date:   Wed Oct 27 22:08:01 2021 +0300

    Added gitignore

commit 7d30591ba11148bd7312e6fd9aeef2026168466e
Author: Konstantin <konstantinpe4enkin@yandex.ru>
Date:   Wed Oct 27 21:44:55 2021 +0300

    First commit

commit e0669d9a548186fb9f5b7983556662f74204aa20
Author: k0pec <k.pe4enkin@gmail.com>
Date:   Sat Oct 23 02:23:52 2021 +0300

    1.1 Into to DevOps - Home Work

commit 8a7e02da07d9344f25ab1564fdc3bd6d863cd733
Author: k0pec <56580472+k0pec@users.noreply.github.com>
Date:   Thu Oct 21 22:07:33 2021 +0300

    Initial commit
k0pec@k0pec-ub:~/netology_devops$ git show
commit 8b39c2c2dcc577b298ed5a343a5c09d671c047df (HEAD -> main)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Thu Nov 4 22:12:20 2021 +0300

    prepare for merge and rebase

diff --git a/2.3_Git_Branching/branching/merge.sh b/2.3_Git_Branching/branching/merge.sh
new file mode 100644
index 0000000..51db910
--- /dev/null
+++ b/2.3_Git_Branching/branching/merge.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+# display command line options
+
+count=1
+for param in "$*"; do
+    echo "\$* Parameter #$count = $param"
+    count=$(( $count + 1 ))
+done
diff --git a/2.3_Git_Branching/branching/rebase.sh b/2.3_Git_Branching/branching/rebase.sh
new file mode 100644
index 0000000..51db910
--- /dev/null
+++ b/2.3_Git_Branching/branching/rebase.sh
@@ -0,0 +1,8 @@
+#!/bin/bash
+# display command line options
+
+count=1
+for param in "$*"; do
+    echo "\$* Parameter #$count = $param"
+    count=$(( $count + 1 ))
+done
k0pec@k0pec-ub:~/netology_devops$ git remote -v
bitbucket	git@bitbucket.org:k0pec/netology_devops.git (fetch)
bitbucket	git@bitbucket.org:k0pec/netology_devops.git (push)
gitlab	git@gitlab.com:k0pec/netology_devops.git (fetch)
gitlab	git@gitlab.com:k0pec/netology_devops.git (push)
origin	git@github.com:k0pec/netology_devops.git (fetch)
origin	git@github.com:k0pec/netology_devops.git (push)
k0pec@k0pec-ub:~/netology_devops$ git rename origin github
git: «rename» не является командой git. Смотрите «git --help».

Самые похожие команды:
	rebase
k0pec@k0pec-ub:~/netology_devops$ git push origin
Перечисление объектов: 6, готово.
Подсчет объектов: 100% (6/6), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 512 байтов | 512.00 КиБ/с, готово.
Всего 5 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:k0pec/netology_devops.git
   e707805..8b39c2c  main -> main
k0pec@k0pec-ub:~/netology_devops$ git checkout -b git-merge
Переключено на новую ветку «git-merge»
k0pec@k0pec-ub:~/netology_devops$ git status
На ветке git-merge
Изменения, которые не в индексе для коммита:
  (используйте «git add <файл>…», чтобы добавить файл в индекс)
  (используйте «git restore <файл>…», чтобы отменить изменения в рабочем каталоге)
	изменено:      2.3_Git_Branching/branching/merge.sh

нет изменений добавленных для коммита
(используйте «git add» и/или «git commit -a»)
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git commit -m 'merge: @ instead *'
[git-merge f0f8af6] merge: @ instead *
 1 file changed, 2 insertions(+), 2 deletions(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin git-merge
Перечисление объектов: 9, готово.
Подсчет объектов: 100% (9/9), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 439 байтов | 439.00 КиБ/с, готово.
Всего 5 (изменения 2), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote: 
remote: Create a pull request for 'git-merge' on GitHub by visiting:
remote:      https://github.com/k0pec/netology_devops/pull/new/git-merge
remote: 
To github.com:k0pec/netology_devops.git
 * [new branch]      git-merge -> git-merge
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git commit -m 'merge: use shift'
[git-merge ea48f1c] merge: use shift
 1 file changed, 3 insertions(+), 2 deletions(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin git-merge
\Перечисление объектов: 9, готово.
Подсчет объектов: 100% (9/9), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 510 байтов | 510.00 КиБ/с, готово.
Всего 5 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:k0pec/netology_devops.git
   f0f8af6..ea48f1c  git-merge -> git-merge
k0pec@k0pec-ub:~/netology_devops$ git checkout master
error: pathspec 'master' did not match any file(s) known to git
k0pec@k0pec-ub:~/netology_devops$ git checkout main
Переключено на ветку «main»
Ваша ветка обновлена в соответствии с «origin/main».
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git commit -m 'change rebase.sh'
[main f2f23bb] change rebase.sh
 1 file changed, 4 insertions(+), 2 deletions(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin main
Перечисление объектов: 9, готово.
Подсчет объектов: 100% (9/9), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 444 байта | 444.00 КиБ/с, готово.
Всего 5 (изменения 2), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:k0pec/netology_devops.git
   8b39c2c..f2f23bb  main -> main
k0pec@k0pec-ub:~/netology_devops$ git log
commit f2f23bb07bdba7894c0d5f91e0b2cc8df0037937 (HEAD -> main, origin/main, origin/HEAD)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Thu Nov 4 22:25:35 2021 +0300

    change rebase.sh

commit 8b39c2c2dcc577b298ed5a343a5c09d671c047df
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Thu Nov 4 22:12:20 2021 +0300

    prepare for merge and rebase

commit e7078052a0abb1123322001f8692d0cff93cc31b (tag: v0.1, gitlab/main, bitbucket/main)
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Sat Oct 30 15:26:00 2021 +0300

    add text README.md

commit 9d6221225a4404b216e8e8eb33d6f84f649474ba
Merge: 0d4bdca 8ee1db6
Author: kpechenkin <konstantinpe4enkin@yandex.ru>
Date:   Sat Oct 30 15:16:25 2021 +0300

    Merge branch 'main' of github.com:k0pec/netology_devops into main

commit 0d4bdca433d047288b2512eb1d9eedc0a6479fa6 (tag: v0.0)
k0pec@k0pec-ub:~/netology_devops$ git checkout 8b39c2c2dcc577b298ed5a343a5c09d671c047df
Note: switching to '8b39c2c2dcc577b298ed5a343a5c09d671c047df'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD сейчас на 8b39c2c prepare for merge and rebase
k0pec@k0pec-ub:~/netology_devops$ git checkout -b git-rebase
Переключено на новую ветку «git-rebase»
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git commit -m 'git-rebase 1'
[git-rebase 64c406f] git-rebase 1
 1 file changed, 4 insertions(+), 2 deletions(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin git-rebase
Перечисление объектов: 9, готово.
Подсчет объектов: 100% (9/9), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 449 байтов | 449.00 КиБ/с, готово.
Всего 5 (изменения 2), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
remote: 
remote: Create a pull request for 'git-rebase' on GitHub by visiting:
remote:      https://github.com/k0pec/netology_devops/pull/new/git-rebase
remote: 
To github.com:k0pec/netology_devops.git
 * [new branch]      git-rebase -> git-rebase
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git commit -m 'git-rebase 2'
[git-rebase 5882c00] git-rebase 2
 1 file changed, 1 insertion(+), 1 deletion(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin git-rebase
Перечисление объектов: 9, готово.
Подсчет объектов: 100% (9/9), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (5/5), 422 байта | 422.00 КиБ/с, готово.
Всего 5 (изменения 2), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:k0pec/netology_devops.git
   64c406f..5882c00  git-rebase -> git-rebase
k0pec@k0pec-ub:~/netology_devops$ git checkout main
Переключено на ветку «main»
Ваша ветка обновлена в соответствии с «origin/main».
k0pec@k0pec-ub:~/netology_devops$ git merge git-merge
подсказка: Ожидание, пока вы закроете редактор с файлом… /snap/notepadqq/855/bin/desktop-launch: line 164: $'\321\201\321\202\320\276\320\273': command not found
Qt: Session management error: Could not open network socket
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) propsReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.143\" (uid=1000 pid=7716 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.DBus.Properties\" member=\"GetAll\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) nmReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.143\" (uid=1000 pid=7716 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.NetworkManager\" member=\"GetDevices\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
"Object path cannot be empty"
Missing icon:  "go-previous"
Missing icon:  "go-next"
Missing icon:  "view-refresh"
Missing icon:  "document-open-recent"
Missing icon:  "application-exit"
Missing icon:  "edit-delete"
Missing icon:  "edit-select-all"
Missing icon:  "go-next"
Missing icon:  "go-previous"
Missing icon:  "go-jump"
Missing icon:  "view-fullscreen"
Missing icon:  "system-run"
Missing icon:  "window-new"
Missing icon:  "help-about"
Merge made by the 'recursive' strategy.
 2.3_Git_Branching/branching/merge.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
k0pec@k0pec-ub:~/netology_devops$ git push origin
Перечисление объектов: 10, готово.
Подсчет объектов: 100% (10/10), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (4/4), 421 байт | 421.00 КиБ/с, готово.
Всего 4 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:k0pec/netology_devops.git
   f2f23bb..f5f702d  main -> main
k0pec@k0pec-ub:~/netology_devops$ git checkout git-rebase
Переключено на ветку «git-rebase»
k0pec@k0pec-ub:~/netology_devops$ git rebase -i main
подсказка: Ожидание, пока вы закроете редактор с файлом… /snap/notepadqq/855/bin/desktop-launch: line 164: $'\321\201\321\202\320\276\320\273': command not found
Qt: Session management error: Could not open network socket
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) propsReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.144\" (uid=1000 pid=7903 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.DBus.Properties\" member=\"GetAll\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) nmReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.144\" (uid=1000 pid=7903 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.NetworkManager\" member=\"GetDevices\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
"Object path cannot be empty"
Missing icon:  "go-previous"
Missing icon:  "go-next"
Missing icon:  "view-refresh"
Missing icon:  "document-open-recent"
Missing icon:  "application-exit"
Missing icon:  "edit-delete"
Missing icon:  "edit-select-all"
Missing icon:  "go-next"
Missing icon:  "go-previous"
Missing icon:  "go-jump"
Missing icon:  "view-fullscreen"
Missing icon:  "system-run"
Missing icon:  "window-new"
Missing icon:  "help-about"
Автослияние 2.3_Git_Branching/branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в 2.3_Git_Branching/branching/rebase.sh
error: не удалось применить коммит 64c406f… git-rebase 1
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 64c406f... git-rebase 1
k0pec@k0pec-ub:~/netology_devops$ git rebase -i main
fatal: It seems that there is already a rebase-merge directory, and
I wonder if you are in the middle of another rebase.  If that is the
case, please try
	git rebase (--continue | --abort | --skip)
If that is not the case, please
	rm -fr ".git/rebase-merge"
and run me again.  I am stopping in case you still have something
valuable there.

k0pec@k0pec-ub:~/netology_devops$ git add rebase.sh
fatal: спецификатор пути «rebase.sh» не соответствует ни одному файлу
k0pec@k0pec-ub:~/netology_devops$ git status
интерактивное перемещение в процессе; над f5f702d
Последняя команда выполнена (1 команда выполнена):
   pick 64c406f git-rebase 1
Следующая команда для выполнения (1 команда осталась):
   pick 5882c00 git-rebase 2
  (используйте «git rebase --edit-todo», чтобы просмотреть или изменить их)
Вы сейчас перемещаете ветку «git-rebase» над «f5f702d».
  (разрешите конфликты, затем запустите «git rebase --continue»)
  (используйте «git rebase --skip», чтобы пропустить этот патч)
  (используйте «git rebase --abort», чтобы перейти на оригинальную ветку)

Не слитые пути:
  (используйте «git restore --staged <файл>…», чтобы убрать из индекса)
  (используйте «git add <файл>…», чтобы пометить разрешение конфликта)
	оба изменены:   2.3_Git_Branching/branching/rebase.sh

нет изменений добавленных для коммита
(используйте «git add» и/или «git commit -a»)
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git rebase --continue
подсказка: Ожидание, пока вы закроете редактор с файлом… /snap/notepadqq/855/bin/desktop-launch: line 164: $'\321\201\321\202\320\276\320\273': command not found
Qt: Session management error: Could not open network socket
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) propsReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.145\" (uid=1000 pid=8097 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.DBus.Properties\" member=\"GetAll\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) nmReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.145\" (uid=1000 pid=8097 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.NetworkManager\" member=\"GetDevices\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
"Object path cannot be empty"
Missing icon:  "go-previous"
Missing icon:  "go-next"
Missing icon:  "view-refresh"
Missing icon:  "document-open-recent"
Missing icon:  "application-exit"
Missing icon:  "edit-delete"
Missing icon:  "edit-select-all"
Missing icon:  "go-next"
Missing icon:  "go-previous"
Missing icon:  "go-jump"
Missing icon:  "view-fullscreen"
Missing icon:  "system-run"
Missing icon:  "window-new"
Missing icon:  "help-about"
[отделённый HEAD b28245d] git-rebase 1
 1 file changed, 3 insertions(+), 1 deletion(-)
Автослияние 2.3_Git_Branching/branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в 2.3_Git_Branching/branching/rebase.sh
error: не удалось применить коммит 5882c00… git-rebase 2
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 5882c00... git-rebase 2
k0pec@k0pec-ub:~/netology_devops$ git add *
k0pec@k0pec-ub:~/netology_devops$ git rebase --continue
подсказка: Ожидание, пока вы закроете редактор с файлом… /snap/notepadqq/855/bin/desktop-launch: line 164: $'\321\201\321\202\320\276\320\273': command not found
Qt: Session management error: Could not open network socket
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) propsReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.146\" (uid=1000 pid=8274 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.DBus.Properties\" member=\"GetAll\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
QNetworkManagerInterface::QNetworkManagerInterface(QObject*) nmReply "An AppArmor policy prevents this sender from sending this message to this recipient; type=\"method_call\", sender=\":1.146\" (uid=1000 pid=8274 comm=\"/snap/notepadqq/855/usr/local/lib/notepadqq/notepa\" label=\"snap.notepadqq.notepadqq (enforce)\") interface=\"org.freedesktop.NetworkManager\" member=\"GetDevices\" error name=\"(unset)\" requested_reply=\"0\" destination=\"org.freedesktop.NetworkManager\" (uid=0 pid=994 comm=\"/usr/sbin/NetworkManager --no-daemon \" label=\"unconfined\")"
"Object path cannot be empty"
Missing icon:  "go-previous"
Missing icon:  "go-next"
Missing icon:  "view-refresh"
Missing icon:  "document-open-recent"
Missing icon:  "application-exit"
Missing icon:  "edit-delete"
Missing icon:  "edit-select-all"
Missing icon:  "go-next"
Missing icon:  "go-previous"
Missing icon:  "go-jump"
Missing icon:  "view-fullscreen"
Missing icon:  "system-run"
Missing icon:  "window-new"
Missing icon:  "help-about"
[отделённый HEAD b743f8e] git-rebase 2
 1 file changed, 2 insertions(+), 2 deletions(-)
Successfully rebased and updated refs/heads/git-rebase.
k0pec@k0pec-ub:~/netology_devops$ git push -u origin git-rebase
To github.com:k0pec/netology_devops.git
 ! [rejected]        git-rebase -> git-rebase (non-fast-forward)
error: не удалось отправить некоторые ссылки в «git@github.com:k0pec/netology_devops.git»
подсказка: Обновления были отклонены, так как верхушка вашей текущей ветки
подсказка: позади ее внешней части. Заберите и слейте внешние изменения 
подсказка: (например, с помощью «git pull …») перед повторной попыткой отправки
подсказка: изменений.
подсказка: Для дополнительной информации, смотрите «Note about fast-forwards»
подсказка: в «git push --help».
k0pec@k0pec-ub:~/netology_devops$ git push -u origin git-rebase -f
Перечисление объектов: 14, готово.
Подсчет объектов: 100% (14/14), готово.
При сжатии изменений используется до 6 потоков
Сжатие объектов: 100% (8/8), готово.
Запись объектов: 100% (10/10), 860 байтов | 860.00 КиБ/с, готово.
Всего 10 (изменения 4), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (4/4), completed with 2 local objects.
To github.com:k0pec/netology_devops.git
 + 5882c00...b743f8e git-rebase -> git-rebase (forced update)
Ветка «git-rebase» отслеживает внешнюю ветку «git-rebase» из «origin».
k0pec@k0pec-ub:~/netology_devops$ git checkout main
Переключено на ветку «main»
Ваша ветка обновлена в соответствии с «origin/main».
k0pec@k0pec-ub:~/netology_devops$ git merge git-rebase
Обновление f5f702d..b743f8e
Fast-forward
 2.3_Git_Branching/branching/rebase.sh | 2 ++
 1 file changed, 2 insertions(+)

