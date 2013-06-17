**GIT USEFUL COMMANDS**

*View branches*
```
git branch
```

*Create branch*
```
git branch nuevafuncionalidad
```

*Change branch*
```
git checkout nuevafuncionalidad
```

*Merge current branch with another_branch*
```
git merge nuevafuncionalidad
```

*Eliminar branch*
```
git branch -d nuevafuncionalidad
```

*Deshacer ultimo merge*
```
git reset --hard HEAD
```

*Ver Log de acciones*
```
git reflog
```

*Volver hasta tal accion*
```
git reset --hard [HEAD@{numero}]
```

*Aplicar un "stash", congelar los cambios
```
git stash
```

*Listar los "stashes"
```
git stash list
```

*Aplicar los "stashes"
quitar el ultimo parametro para aplicar todos.
```
git stash apply stash@{0}
```

