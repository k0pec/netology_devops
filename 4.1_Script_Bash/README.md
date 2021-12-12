# 4.1 Script Bash
## Home Work
1.  k0pec@k0pec-ub:~/netology_devops/4.1_Script_Bash$ echo $c  
    a+b  
    Результат - bash a+b востпринимает как соединение строк a, +, b  

    k0pec@k0pec-ub:~/netology_devops/4.1_Script_Bash$ echo $d  
    1+2    
    Результат - bash воспринимает как соединение значений заданных переменных a, b и  строки +  

    k0pec@k0pec-ub:~/netology_devops/4.1_Script_Bash$ echo $e  
    3  
    Результат - bash  воспринимает как арифметическую операцию сложения над значениями переменных а, b  

2.  #!/usr/bin/env bash
    while ((1==1))  
    do  
    date > $d     
    curl https://localhost:4757  
    if (($? != 0))  
    then  
    echo 'Not Avalible' $d >> curl.log  
    else  
    echo 'Avalible' $d >> curl.log  
    brake  
    fi  
    done  

3.  #!/usr/bin/env bash  
    ip_addr=(192.168.0.1 173.194.222.113 87.250.250.242)  
    for i in ${ip_addr[@]}  
    do  
        for j in {1..5}  
        do  
            date > $d   
            curl http://$i  
            if (($? != 0))  
            then  
                echo $i $d 'not avalible' >> curl.log  
            else  
                echo $i $d 'avalible' >> curl.log  
            fi  
        done  
    done  

4.  #!/usr/bin/env bash  
    ip_addr=(192.168.0.1 173.194.222.113 87.250.250.242)  
    while :  
    do    
        for i in ${ip_addr[@]}  
        do  
            date > $d  
            curl http://$i  
            if (($? != 0))  
            then  
                echo $i $d 'not avalible' >> error.log   
                exit   
            else  
                echo $i $d 'avalible' >> avalible.log    
            fi  
        done   
    done    

5.  k0pec@k0pec-ub:~/netology_devops/.git/hooks$ mv commit-msg.sample commit-msg  
    k0pec@k0pec-ub:~/netology_devops/.git/hooks$ vim commit-msg  

    #!/usr/bin/env bash  
    commit_regex='(^\[04-script-01-bash\].*$)'  
    if ! grep -iqE "$commit_regex" "$1"   
    then  
        echo "Commit message failed" >&2  
        exit 1  
    fi   



