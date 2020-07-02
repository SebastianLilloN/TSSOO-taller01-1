
#!/bin/bash

forma_uso(){
        printf "\nUso $0 -d <directorio datos> [-h]\n"
        printf "\t-d: directorio donde estan los datos a procesar.\n"
        printf "\t-h: muestra este mensaje y termina.\n"
        exit 1
}

while getopts "d:h" opcion; do
        case "$opcion" in


                d)
                        directorio=$OPTARG
                        ;;

                h)
                        forma_uso
                        ;;
                *)
                        echo "Función invalida"
                        forma_uso
                        ;;
        esac
done


BASEDIR=$(readlink -f $0)
BASEDIR=$(dirname $BASEDIR)

##directorio="$BASEDIR/$directorio"

if [ ! -d $directorio ]; then
        echo "Error: El directorio $directorio no existe."
        exit 1
fi

if [ ! "$(ls $directorio)" ]; then
        echo "El directorio $directorio se encuentra vacio"
  exit 1
fi




Operaciones(){



repositorio=$(cat suma2.txt | awk 'BEGIN { min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                total+=$1; count+=1;\
        } \
        END { print total":", total/count":", min":", max}')

rm -f suma2.txt
echo $repositorio >>evacuation.txt

}



#problema 1

Arrays=(`find . -name '*.txt' -print |sort |grep -v '._'`)

ArraysexecutionSummary=(`find . -name 'executionSummary*.txt' -print |sort |grep -v '._'`)


for i in ${ArraysexecutionSummary[*]};

 do
         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$6+$7+$8;}END{print sum}'>>suma.txt;       #sumas parciales


         repositorio=$(cat suma.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
             if($1>max){max=$1};\
                total+=$1; count+=1;\
             } \
             END { print total":", total/count":", min":", max}')


         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$9;}END{print sum}'>>memoria.txt;          #sumas parciales memoria

         repositorio2=$(cat memoria.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

            if($1>max){max=$1};\
                 total+=$1; count+=1;\
            } \
            END { print total":", total/count":", min":", max}')

 done
rm -f suma.txt memoria.txt

printf "tsimTotal:promedio:min:max\n" >> metrics.txt
echo $repositorio >>metrics.txt
printf "memUsed:promedio:min:max\n" >> metrics.txt
echo $repositorio2 >>metrics.txt



#problema 2


ArraysSummary=(`find . -name 'summary*.txt' -print |sort |grep -v '._'`)

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum+=$7;}END{print sum}'>>suma2.txt; done


printf "alls:promedio:min:max\n" >> evacuation.txt

Operaciones;


printf "residents:promedio:min:max\n" >> evacuation.txt
printf "visitorsI:promedio:min:max\n" >> evacuation.txt

for j in $(seq 0 1);
    do
        for i in ${ArraysSummary[*]};
        do
            cat $i | tail -n+2 | awk -F ':' '$3 == '$j' {sum=0;sum+=$7;print sum};'>>suma2.txt;

        done

        Operaciones;

    done


printf "residents-G0:promedio:min:max\n" >> evacuation.txt
printf "residents-G1:promedio:min:max\n" >> evacuation.txt
printf "residents-G2:promedio:min:max\n" >> evacuation.txt
printf "residents-G3:promedio:min:max\n" >> evacuation.txt
printf "visitorsI-G0:promedio:min:max\n" >> evacuation.txt
printf "visitorsI-G1:promedio:min:max\n" >> evacuation.txt
printf "visitorsI-G2:promedio:min:max\n" >> evacuation.txt
printf "visitorsI-G3:promedio:min:max\n" >> evacuation.txt

for k in $(seq 0 3);
    do
        for j in $(seq 0 1);
        do
            for i in ${ArraysSummary[*]};
            do
                cat $i | tail -n+2 | awk -F ':' '{if ($3=='$j' && $4=='$k') {sum=0;sum+=$7;print sum}};'>>suma2.txt;
            done

            Operaciones;

        done
    done



#problema 3

ArraysusePhone=(`find . -name 'usePhone*.txt' -print |sort |grep -v '._'`)

printf "timestamp:promedio:min:max\n" >> usePhone-stats.txt


for i in ${ArraysusePhone[*]}; do

        echo  $i; MedicionTiempo=(`cat $i |tail -n+3 |cut -d ":" -f 3`);

        for i in ${MedicionTiempo[*]}; do

                echo -n $i":" >> movil.txt;

        done; echo "" >> movil.txt;

done


for i in $(seq 1 360); do

                repositorio=$(cat movil.txt | cut -d ':' -f $i | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
             if($1>max){max=$1};\
                total+=$1; count+=1;\
             } \
             END { print  total/count":",  min":", max}')



        echo $i"0:"$repositorio  >> usePhone-stats.txt

done

rm -f movil.txt








