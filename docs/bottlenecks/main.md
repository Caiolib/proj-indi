# Bottlenecks Aplicados

Este documento descreve as principais soluções de monitoramento e caching implementadas em nossa plataforma para identificar e mitigar gargalos de performance.

---

## 1. Monitoramento com Prometheus e Grafana

Para garantir alta disponibilidade e tempo de resposta, utilizamos Prometheus para coletar métricas e Grafana para visualizar dashboards em tempo real. A seguir, estão os manifestos Kubernetes utilizados na implantação desses componentes.

### 1.1. Grafana

- **Objetivo**: Interface gráfica para visualizar métricas coletadas pelo Prometheus, criar alertas e dashboards customizados.
- **Manifesto Kubernetes**:  
  [grafana.yaml](https://raw.githubusercontent.com/joaopgs4/api-principal/refs/heads/main/api/k8s/grafana.yaml)

### 1.2. Prometheus

#### 1.2.1. Deployment e Service

- **Objetivo**: Implantar o servidor Prometheus que irá “scrapar” as métricas das aplicações e do cluster.
- **Manifesto Kubernetes**:  
  [prometheus.yaml](https://raw.githubusercontent.com/joaopgs4/api-principal/refs/heads/main/api/k8s/prometheus.yaml)

#### 1.2.2. Configuração

- **Objetivo**: Definir targets, regras de scrape e alerting rules para o Prometheus.
- **Manifesto Kubernetes (ConfigMap)**:  
  [prometheus-config.yaml](https://raw.githubusercontent.com/joaopgs4/api-principal/refs/heads/main/api/k8s/prometheus-config.yaml)

---

## 2. Caching de Produtos com Redis

Para reduzir a latência nas requisições à rota `GET /product/{id}`, configuramos um caching em memória usando Redis. Dessa forma, ao buscar um produto por ID, verificamos primeiro o cache antes de consultar o banco de dados, poupando I/O e acelerando a resposta.

- **Objetivo**: Melhorar o tempo de resposta da aplicação de produtos, diminuindo a carga no banco de dados.
- **Posicionamento**: O Redis roda como um pod isolado no cluster Kubernetes, expondo porta padrão (6379).
- **Manifesto Kubernetes**:  
  [redis.yaml](https://raw.githubusercontent.com/joaopgs4/api-principal/refs/heads/main/api/k8s/redis.yaml)

---


### Resumo das Melhorias

- **Visibilidade em Tempo Real**: Com Prometheus + Grafana, monitoramos métricas de todas as aplicações (Auth, Account, Product, Gateway, etc.), identificando rapidamente qualquer degradação.
- **Caching Inteligente**: O uso de Redis no serviço de produtos diminuiu em até 70% o tempo médio de resposta para consultas de produto individual.
- **Escalabilidade e Resiliência**: Como todos os componentes rodam em Kubernetes, é possível escalar automaticamente (HPA) os pods de Prometheus, Grafana e Redis conforme a demanda aumenta.

> **Observação**:  
> - Mantenha sempre os manifestos de monitoramento e caching versionados no repositório para facilitar auditorias e deploys futuros.  
> - Ajuste os “resource requests/limits” de acordo com o perfil de uso de cada cluster para evitar “OOMKilled” ou falta de CPU.

## Conclusão

A implementação dessas soluções de monitoramento e caching é fundamental para garantir a performance e a confiabilidade da nossa plataforma. Com o Prometheus e Grafana, temos visibilidade em tempo real do estado do sistema, enquanto o Redis nos permite responder rapidamente às requisições mais frequentes, melhorando a experiência do usuário final.
