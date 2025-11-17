Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1  


 
Import-Module -name  terminal-icons  


$randomNumber = Get-Random -Minimum 1 -Maximum  10 
if( $randomNumber   -eq  1  ) { 
      Invoke-Expression (&starship init powershell)   

} elseif  ( $randomNumber -eq 2  ) { 
   oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\neko.omp.json" | Invoke-Expression  

} elseif ( $randomNumber -eq 3 ) { 
 oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression  
}elseif ( $randomNumber -eq 4 ) {
  oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\1_shell.omp.json" | Invoke-Expression  
}elseif (  $randomNumber -eq 5 ) {
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kali.omp.json" | Invoke-Expression  
}elseif  ( $randomNumber -eq 6 )  { 
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\smoothie.omp.json" | Invoke-Expression  
}elseif ( $randomNumber -eq 7 ) {
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\spaceship.omp.json" | Invoke-Expression  
}elseif ( $randomNumber -eq 8 ){
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression  
}elseif ( $randomNumber -eq 9 ) { 
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\velvet.omp.json" | Invoke-Expression  
}




 
