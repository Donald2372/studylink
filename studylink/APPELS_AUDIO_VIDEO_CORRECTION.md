# Correction StudyLink — appels audio, vidéo et partage d'écran

Cette version corrige le flux WebRTC de StudyLink.

## Ce qui a été renforcé

- Le canal audio est négocié explicitement avec un transceiver `sendrecv`.
- Le canal vidéo est aussi créé même pendant un appel audio, afin de permettre le partage d'écran plus tard.
- Le son distant est lu dans un élément audio dédié.
- Si la caméra échoue, l'appel continue en audio.
- Un bouton `Relancer le flux` permet de relancer l'échange WebRTC/ICE sans quitter l'appel.
- Les offres WebRTC sont renvoyées si la première négociation reste bloquée.
- L'écran affiche l'état réseau : STUN seul, TURN actif, ICE checking, ICE connected, ICE failed.

## Point important pour que ça marche entre deux appareils différents

Pour que l'audio et la vidéo passent de manière fiable entre deux utilisateurs qui ne sont pas sur le même réseau, le backend doit avoir un serveur TURN.

Variables Render possibles :

```env
TWILIO_ACCOUNT_SID=...
TWILIO_AUTH_TOKEN=...
TWILIO_TURN_TTL=3600
```

ou avec un TURN statique :

```env
TURN_URL=turn:ton-serveur-turn:3478
TURN_USERNAME=...
TURN_CREDENTIAL=...
```

Sans TURN, WebRTC peut fonctionner sur le même Wi-Fi, mais il échoue souvent entre deux réseaux différents, entre téléphone et PC, ou avec certains opérateurs mobiles.

## Déploiement

1. Redéployer Render pour le backend.
2. Redéployer Vercel pour le frontend.
3. Tester avec deux comptes différents.
4. Autoriser le micro et la caméra dans le navigateur.
5. Si l'appel reste bloqué, cliquer sur `Relancer le flux`.
