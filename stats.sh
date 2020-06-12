
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
        END { print":" total":", total/count":", min":", max}')

rm -f suma2.txt
echo $repositorio >>evacuation.txt

}

#problema 1

Arrays=(`find . -name '*.txt' -print |sort |grep -v '._'`)

#cat ${Arreglo[*]}


ArraysexecutionSummary=(`find . -name 'executionSummary*.txt' -print |sort |grep -v '._'`)


for i in ${ArraysexecutionSummary[*]};

 do
         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$6+$7+$8;}END{print sum}'>>suma.txt;       #sumas parciales


         repositorio=$(cat suma.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\
             if($1>max){max=$1};\
                total+=$1; count+=1;\
             } \
             END { print"TsimTotal\n"":" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')


         cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum=$9;}END{print sum}'>>memoria.txt;          #sumas parciales memoria

         repositorio2=$(cat memoria.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

            if($1>max){max=$1};\
                 total+=$1; count+=1;\
            } \
            END { print"Memoria\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')

 done

rm -f suma.txt memoria.txt
echo $repositorio  >>metrics.txt
echo $repositorio2 >>metrics.txt


#problema 2


ArraysSummary=(`find . -name 'summary*.txt' -print |sort |grep -v '._'`)

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' 'BEGIN{sum=0}{sum+=$7;}END{print sum}'>>suma2.txt; done



repositorio=$(cat suma2.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"alls\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')

rm -f suma2.txt
echo $repositorio >>evacuation.txt


for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '$3 == 0 {sum=0;sum+=$7;print sum};' >> suma2.txt; done



repositorio=$(cat suma2.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"residents\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')

rm -f  suma2.txt
echo $repositorio >>evacuation.txt



for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '$3 == 1 {sum=0;sum+=$7;print sum};' >> suma2.txt; done


respositorio=$(cat suma2.txt | awk 'BEGIN{ min=2**63-1; max=0}{ if($1<min){min=$1};\

        if($1>max){max=$1};\
                 total+=$1; count+=1;\
        } \
                END { print"visitorsI\n" total":","Promedio\n" total/count":","min\n" min":","max\n" max}')

rm -f suma2.txt
echo $repositorio >>evacuation.txt


for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==0 && $4==0) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==0 && $4==1) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==0 && $4==2) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==0 && $4==3) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==1 && $4==0) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==1 && $4==1) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==1 && $4==2) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;

for i in ${ArraysSummary[*]}; do cat $i | tail -n+2 | awk -F ':' '{if ($3==1 && $4==3) {sum=0;sum+=$7;print sum}};'>>suma2.txt; done

Operaciones;


#problema 3

ArraysusePhone=(`find . -name 'usePhone*.txt' -print |sort |grep -v '._'`)

rm -f test.txt;

for i in ${ArraysusePhone[*]}; do

        MedicionTiempo=(`cat $i |tail -n+2 |cut -d ":" -f 2,3`);

        for i in ${MedicionTiempo[*]}; do

                echo -n ":"$i >> test.txt;

        done; echo "" >> test.txt;

done








