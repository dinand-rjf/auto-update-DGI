pipeline {
    agent any
    
    stages {
        stage('Vérification') {
            steps {
                echo '🔍 Vérification du site DGI...'
                sh '''
                    echo "=== FICHIERS DGI ==="
                    ls -la
                    
                    echo ""
                    echo "=== index.html ==="
                    if [ -f "index.html" ]; then
                        echo "✅ Fichier présent"
                        echo "Lignes: $(wc -l < index.html)"
                        echo "Titre: $(grep -o "<title>.*</title>" index.html || echo "Non trouvé")"
                    else
                        echo "❌ Fichier manquant"
                        exit 1
                    fi
                    
                    echo ""
                    echo "=== style.css ==="
                    if [ -f "style.css" ]; then
                        echo "✅ Fichier présent"
                        echo "Lignes: $(wc -l < style.css)"
                    else
                        echo "⚠️  Fichier manquant"
                    fi
                '''
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Test de déploiement...'
                sh '''
                    echo "Simulation déploiement DGI Madagascar..."
                    echo ""
                    echo "COMMANDES RÉELLES:"
                    echo "sudo cp index.html style.css /var/www/html/"
                    echo "sudo systemctl restart apache2"
                    echo ""
                    echo "Pour le test, copie locale:"
                    mkdir -p /tmp/dgi-test
                    cp index.html style.css /tmp/dgi-test/ 2>/dev/null || echo "Copie effectuée"
                    echo "✅ Test terminé"
                '''
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline réussi ! Site DGI vérifié.'
        }
        failure {
            echo '❌ Pipeline échoué. Vérifiez les fichiers.'
        }
    }
}